from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy.orm import Session
from sqlalchemy import text

from app.core.db import get_db
from app.core.security import verify_password, create_access_token
from app.core.dependencies import get_current_user_id

router = APIRouter(prefix="/api/auth", tags=["인증"])


class LoginRequest(BaseModel):
    email: str
    password: str


@router.post("/login")
def login(payload: LoginRequest, db: Session = Depends(get_db)):
    row = db.execute(
        text(
            """
            SELECT u.id, u.email, u.password_hash, u.name, u.role_id,
                   r.code AS role_code
              FROM users u
              LEFT JOIN roles r ON r.id = u.role_id
             WHERE u.email = :email
               AND u.deleted_at IS NULL
            """
        ),
        {"email": payload.email},
    ).mappings().first()

    if not row:
        raise HTTPException(status_code=401, detail="이메일 또는 비밀번호가 올바르지 않습니다.")

    if not verify_password(payload.password, row["password_hash"]):
        raise HTTPException(status_code=401, detail="이메일 또는 비밀번호가 올바르지 않습니다.")

    token = create_access_token(subject=str(row["id"]))
    return {
        "access_token": token,
        "token_type": "bearer",
        "user": {
            "id": row["id"],
            "email": row["email"],
            "name": row["name"],
            "role_id": row["role_id"],
            "role_code": row.get("role_code"),
        },
    }


@router.get("/me")
def me(user_id: int = Depends(get_current_user_id), db: Session = Depends(get_db)):
    row = db.execute(
        text(
            """
            SELECT u.id, u.email, u.name, u.role_id, u.department_id, u.status,
                   r.code AS role_code
              FROM users u
              LEFT JOIN roles r ON r.id = u.role_id
             WHERE u.id = :id
               AND u.deleted_at IS NULL
            """
        ),
        {"id": user_id},
    ).mappings().first()

    if not row:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="사용자를 찾을 수 없습니다.")

    return {
        "id": row["id"],
        "email": row["email"],
        "name": row["name"],
        "role_id": row["role_id"],
        "role_code": row.get("role_code"),
        "department_id": row["department_id"],
        "status": row["status"],
    }
