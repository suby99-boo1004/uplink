import React, { useState } from "react";
import { useAuth } from "../lib/auth";

export default function LoginPage() {
  const { login } = useAuth();
  const [email, setEmail] = useState("이동섭");
  const [password, setPassword] = useState("");
  const [err, setErr] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setErr(null);
    setBusy(true);
    try {
      await login(email.trim(), password);
    } catch (e: any) {
      setErr(e?.message || "로그인에 실패했습니다.");
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="container" style={{ paddingTop: 44 }}>
      <div className="card" style={{ maxWidth: 520, margin: "0 auto", padding: 18 }}>
        <div className="vstack" style={{ gap: 6 }}>
          <div className="hstack" style={{ justifyContent: "space-between" }}>
            <div className="hstack">
              <div className="badge">UPLINK</div>
              <div style={{ fontWeight: 800, fontSize: 18 }}>업링크 로그인</div>
            </div>
            <div className="badge">모바일 대응</div>
          </div>

          <div className="small">
            회사 엔진(Uplink)에 접속합니다. 로그인 후 업무 메뉴가 활성화됩니다.
          </div>

          <div className="hr" />

          <form onSubmit={onSubmit} className="vstack" style={{ gap: 10 }}>
            <div className="vstack" style={{ gap: 6 }}>
              <div className="small">이메일(ID)</div>
              <input
                className="input"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="admin@uplink.local"
                autoComplete="username"
              />
            </div>

            <div className="vstack" style={{ gap: 6 }}>
              <div className="small">비밀번호</div>
              <input
                className="input"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="비밀번호"
                autoComplete="current-password"
              />
            </div>

            {err && (
              <div className="card" style={{ borderColor: "rgba(255,106,106,.35)", padding: 12 }}>
                <div style={{ color: "var(--danger)", fontSize: 13 }}>{err}</div>
              </div>
            )}

            <button className="btn primary" type="submit" disabled={busy}>
              {busy ? "로그인 중..." : "로그인"}
            </button>

            <div className="small">
              ※ 개발 환경에서는 <b>http://localhost:5173</b>에서 실행되며, API는 <b>/api</b>로 프록시됩니다.
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
