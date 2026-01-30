--
-- PostgreSQL database dump
--

\restrict ITZSI9UaMIHHCLKMJga7va8x4rh8cybr16KwCkP36nuKXmABt1UVbEAg6jcIVBh

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-30 15:25:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 932 (class 1247 OID 16402)
-- Name: attendance_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.attendance_status AS ENUM (
    'WORKING',
    'OUTSIDE',
    'OFF',
    'LEAVE',
    'HALF_DAY',
    'ABSENT'
);


ALTER TYPE public.attendance_status OWNER TO postgres;

--
-- TOC entry 1091 (class 1247 OID 17823)
-- Name: estimate_business_state; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estimate_business_state AS ENUM (
    'ONGOING',
    'DONE',
    'CANCELED'
);


ALTER TYPE public.estimate_business_state OWNER TO postgres;

--
-- TOC entry 1097 (class 1247 OID 17846)
-- Name: estimate_calc_mode; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estimate_calc_mode AS ENUM (
    'NORMAL',
    'PERCENT_OF_SUBTOTAL',
    'FORMULA'
);


ALTER TYPE public.estimate_calc_mode OWNER TO postgres;

--
-- TOC entry 1094 (class 1247 OID 17832)
-- Name: estimate_section_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estimate_section_type AS ENUM (
    'MATERIAL',
    'LABOR',
    'EXPENSE',
    'OVERHEAD',
    'PROFIT',
    'MANUAL'
);


ALTER TYPE public.estimate_section_type OWNER TO postgres;

--
-- TOC entry 947 (class 1247 OID 16450)
-- Name: estimate_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estimate_status AS ENUM (
    'DRAFT',
    'PENDING_APPROVAL',
    'APPROVED',
    'SENT',
    'REVISED',
    'CANCELED'
);


ALTER TYPE public.estimate_status OWNER TO postgres;

--
-- TOC entry 953 (class 1247 OID 16470)
-- Name: item_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.item_category AS ENUM (
    'MATERIAL',
    'LABOR',
    'EQUIPMENT',
    'ETC'
);


ALTER TYPE public.item_category OWNER TO postgres;

--
-- TOC entry 971 (class 1247 OID 16534)
-- Name: movement_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.movement_type AS ENUM (
    'IN',
    'OUT',
    'ADJUST'
);


ALTER TYPE public.movement_type OWNER TO postgres;

--
-- TOC entry 962 (class 1247 OID 16504)
-- Name: mr_source; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.mr_source AS ENUM (
    'FROM_ESTIMATE',
    'FROM_PRODUCT',
    'FROM_DESIGN',
    'MANUAL_TEXT'
);


ALTER TYPE public.mr_source OWNER TO postgres;

--
-- TOC entry 959 (class 1247 OID 16490)
-- Name: mr_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.mr_status AS ENUM (
    'DRAFT',
    'REQUESTED',
    'APPROVED',
    'ORDERED',
    'ISSUED',
    'CLOSED'
);


ALTER TYPE public.mr_status OWNER TO postgres;

--
-- TOC entry 974 (class 1247 OID 16542)
-- Name: post_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.post_category AS ENUM (
    'IDEA',
    'TECH_TIP'
);


ALTER TYPE public.post_category OWNER TO postgres;

--
-- TOC entry 956 (class 1247 OID 16480)
-- Name: price_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.price_type AS ENUM (
    'DESIGN',
    'CONSUMER',
    'SUPPLY',
    'MANUAL'
);


ALTER TYPE public.price_type OWNER TO postgres;

--
-- TOC entry 941 (class 1247 OID 16428)
-- Name: project_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.project_status AS ENUM (
    'PLANNING',
    'IN_PROGRESS',
    'ON_HOLD',
    'DONE',
    'CLOSED'
);


ALTER TYPE public.project_status OWNER TO postgres;

--
-- TOC entry 950 (class 1247 OID 16464)
-- Name: revision_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.revision_status AS ENUM (
    'DRAFT',
    'LOCKED'
);


ALTER TYPE public.revision_status OWNER TO postgres;

--
-- TOC entry 929 (class 1247 OID 16391)
-- Name: role_code; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role_code AS ENUM (
    'ADMIN',
    'OPERATOR',
    'EMPLOYEE',
    'EXTERNAL',
    'GUEST'
);


ALTER TYPE public.role_code OWNER TO postgres;

--
-- TOC entry 935 (class 1247 OID 16416)
-- Name: shift_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.shift_type AS ENUM (
    'DAY',
    'NIGHT'
);


ALTER TYPE public.shift_type OWNER TO postgres;

--
-- TOC entry 944 (class 1247 OID 16440)
-- Name: task_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.task_status AS ENUM (
    'TODO',
    'DOING',
    'DONE',
    'BLOCKED'
);


ALTER TYPE public.task_status OWNER TO postgres;

--
-- TOC entry 965 (class 1247 OID 16514)
-- Name: ticket_priority; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.ticket_priority AS ENUM (
    'LOW',
    'MID',
    'HIGH',
    'URGENT'
);


ALTER TYPE public.ticket_priority OWNER TO postgres;

--
-- TOC entry 968 (class 1247 OID 16524)
-- Name: ticket_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.ticket_status AS ENUM (
    'OPEN',
    'IN_PROGRESS',
    'WAITING',
    'CLOSED'
);


ALTER TYPE public.ticket_status OWNER TO postgres;

--
-- TOC entry 938 (class 1247 OID 16422)
-- Name: work_date_basis; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.work_date_basis AS ENUM (
    'TODAY',
    'NEXT_DAY'
);


ALTER TYPE public.work_date_basis OWNER TO postgres;

--
-- TOC entry 293 (class 1255 OID 17545)
-- Name: attendance_corrections_fill_required_fields_jsonb(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.attendance_corrections_fill_required_fields_jsonb() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- work_date가 NULL이면 target_date로 채움
  IF NEW.work_date IS NULL THEN
    NEW.work_date := COALESCE(NEW.target_date, (now() AT TIME ZONE 'Asia/Seoul')::date);
  END IF;

  -- requested_changes_json이 NULL이면 after_json/before_json/action 기반으로 채움
  IF NEW.requested_changes_json IS NULL THEN
    NEW.requested_changes_json :=
      jsonb_build_object(
        'action', NEW.action,
        'target_date', NEW.target_date,
        'reason', NEW.reason,
        'before', NEW.before_json,
        'after', NEW.after_json
      );
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.attendance_corrections_fill_required_fields_jsonb() OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 17543)
-- Name: attendance_corrections_fill_work_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.attendance_corrections_fill_work_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.work_date IS NULL THEN
    IF NEW.target_date IS NOT NULL THEN
      NEW.work_date := NEW.target_date;
    ELSE
      NEW.work_date := (now() AT TIME ZONE 'Asia/Seoul')::date;
    END IF;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.attendance_corrections_fill_work_date() OWNER TO postgres;

--
-- TOC entry 295 (class 1255 OID 17897)
-- Name: trg_estimate_items_revision_match(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trg_estimate_items_revision_match() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_section_revision bigint;
BEGIN
    SELECT revision_id
      INTO v_section_revision
      FROM public.estimate_sections
     WHERE id = NEW.section_id;

    IF v_section_revision IS NULL THEN
        RAISE EXCEPTION 'Invalid section_id %', NEW.section_id;
    END IF;

    IF NEW.revision_id <> v_section_revision THEN
        RAISE EXCEPTION
        'Revision mismatch: item.revision_id(%) != section.revision_id(%)',
        NEW.revision_id, v_section_revision;
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_estimate_items_revision_match() OWNER TO postgres;

--
-- TOC entry 296 (class 1255 OID 17899)
-- Name: trg_estimate_items_round_money(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trg_estimate_items_round_money() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.line_total := round(NEW.line_total);
    IF NEW.unit_price_snapshot IS NOT NULL THEN
        NEW.unit_price_snapshot := round(NEW.unit_price_snapshot);
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_estimate_items_round_money() OWNER TO postgres;

--
-- TOC entry 294 (class 1255 OID 17888)
-- Name: trg_estimate_items_sync_revision(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trg_estimate_items_sync_revision() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  sec_rev_id bigint;
BEGIN
  SELECT revision_id INTO sec_rev_id
  FROM public.estimate_sections
  WHERE id = NEW.section_id;

  IF sec_rev_id IS NULL THEN
    RAISE EXCEPTION 'estimate_items.section_id(%)가 유효하지 않습니다.', NEW.section_id;
  END IF;

  -- section 기준 revision으로 강제
  NEW.revision_id := sec_rev_id;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_estimate_items_sync_revision() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 235 (class 1259 OID 16736)
-- Name: attendance_corrections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance_corrections (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    work_date date NOT NULL,
    requested_changes_json jsonb NOT NULL,
    reason text NOT NULL,
    status text DEFAULT 'PENDING'::text NOT NULL,
    reviewed_by bigint,
    reviewed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    target_date date,
    action text,
    before_json text,
    after_json text,
    editor_user_id integer
);


ALTER TABLE public.attendance_corrections OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16735)
-- Name: attendance_corrections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attendance_corrections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendance_corrections_id_seq OWNER TO postgres;

--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 234
-- Name: attendance_corrections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attendance_corrections_id_seq OWNED BY public.attendance_corrections.id;


--
-- TOC entry 233 (class 1259 OID 16691)
-- Name: attendance_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance_records (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    work_date date NOT NULL,
    check_in_at timestamp with time zone,
    check_out_at timestamp with time zone,
    status public.attendance_status DEFAULT 'WORKING'::public.attendance_status NOT NULL,
    note text,
    created_by bigint,
    updated_by bigint,
    shift_type public.shift_type DEFAULT 'DAY'::public.shift_type NOT NULL,
    work_date_basis date NOT NULL,
    is_holiday_work boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.attendance_records OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16690)
-- Name: attendance_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attendance_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendance_records_id_seq OWNER TO postgres;

--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 232
-- Name: attendance_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attendance_records_id_seq OWNED BY public.attendance_records.id;


--
-- TOC entry 231 (class 1259 OID 16668)
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    id bigint NOT NULL,
    actor_user_id bigint,
    entity_type text NOT NULL,
    entity_id text NOT NULL,
    action text NOT NULL,
    diff_json jsonb,
    reason text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16667)
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_logs_id_seq OWNER TO postgres;

--
-- TOC entry 5626 (class 0 OID 0)
-- Dependencies: 230
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- TOC entry 229 (class 1259 OID 16650)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    name text NOT NULL,
    type text DEFAULT 'client'::text NOT NULL,
    contact_name text,
    contact_phone text,
    contact_email text,
    memo text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    number integer DEFAULT 0
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16649)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 5629 (class 0 OID 0)
-- Dependencies: 228
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 225 (class 1259 OID 16598)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id bigint NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16597)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 5632 (class 0 OID 0)
-- Dependencies: 224
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 261 (class 1259 OID 17165)
-- Name: design_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.design_items (
    id bigint NOT NULL,
    package_id bigint NOT NULL,
    item_category public.item_category DEFAULT 'LABOR'::public.item_category NOT NULL,
    ref_code text,
    name_snapshot text NOT NULL,
    unit_snapshot text DEFAULT 'EA'::text NOT NULL,
    qty numeric(14,2) DEFAULT 1 NOT NULL,
    unit_price_snapshot numeric(14,2) DEFAULT 0 NOT NULL,
    amount numeric(14,2) DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.design_items OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 17164)
-- Name: design_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.design_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.design_items_id_seq OWNER TO postgres;

--
-- TOC entry 5635 (class 0 OID 0)
-- Dependencies: 260
-- Name: design_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.design_items_id_seq OWNED BY public.design_items.id;


--
-- TOC entry 259 (class 1259 OID 17130)
-- Name: design_packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.design_packages (
    id bigint NOT NULL,
    name text NOT NULL,
    project_id bigint,
    estimate_id bigint,
    status text DEFAULT 'DRAFT'::text NOT NULL,
    created_by bigint NOT NULL,
    memo text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.design_packages OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17129)
-- Name: design_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.design_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.design_packages_id_seq OWNER TO postgres;

--
-- TOC entry 5638 (class 0 OID 0)
-- Dependencies: 258
-- Name: design_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.design_packages_id_seq OWNED BY public.design_packages.id;


--
-- TOC entry 257 (class 1259 OID 17091)
-- Name: estimate_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estimate_items (
    id bigint NOT NULL,
    revision_id bigint NOT NULL,
    line_no integer DEFAULT 1 NOT NULL,
    item_category public.item_category DEFAULT 'MATERIAL'::public.item_category NOT NULL,
    product_id bigint,
    price_type public.price_type DEFAULT 'MANUAL'::public.price_type NOT NULL,
    item_name_snapshot text NOT NULL,
    spec_snapshot text,
    unit_snapshot text DEFAULT 'EA'::text NOT NULL,
    unit_price_snapshot numeric(14,2),
    qty numeric(14,2) DEFAULT 1 NOT NULL,
    line_total numeric(14,2) DEFAULT 0 NOT NULL,
    memo text,
    section_id bigint NOT NULL,
    line_order integer,
    calc_mode public.estimate_calc_mode DEFAULT 'NORMAL'::public.estimate_calc_mode NOT NULL,
    base_section_type public.estimate_section_type,
    formula text
);


ALTER TABLE public.estimate_items OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 17090)
-- Name: estimate_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estimate_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estimate_items_id_seq OWNER TO postgres;

--
-- TOC entry 5641 (class 0 OID 0)
-- Dependencies: 256
-- Name: estimate_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estimate_items_id_seq OWNED BY public.estimate_items.id;


--
-- TOC entry 255 (class 1259 OID 17049)
-- Name: estimate_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estimate_revisions (
    id bigint NOT NULL,
    estimate_id bigint NOT NULL,
    revision_no integer NOT NULL,
    reason text,
    subtotal numeric(14,2) DEFAULT 0 NOT NULL,
    tax numeric(14,2) DEFAULT 0 NOT NULL,
    total numeric(14,2) DEFAULT 0 NOT NULL,
    status public.revision_status DEFAULT 'DRAFT'::public.revision_status NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    receiver_name_snapshot text,
    author_name_snapshot text,
    client_name_snapshot text,
    title_snapshot text
);


ALTER TABLE public.estimate_revisions OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 17048)
-- Name: estimate_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estimate_revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estimate_revisions_id_seq OWNER TO postgres;

--
-- TOC entry 5644 (class 0 OID 0)
-- Dependencies: 254
-- Name: estimate_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estimate_revisions_id_seq OWNED BY public.estimate_revisions.id;


--
-- TOC entry 291 (class 1259 OID 17854)
-- Name: estimate_sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estimate_sections (
    id bigint NOT NULL,
    revision_id bigint NOT NULL,
    section_type public.estimate_section_type NOT NULL,
    section_order integer NOT NULL,
    title text NOT NULL,
    subtotal numeric(14,2) DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.estimate_sections OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 17853)
-- Name: estimate_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.estimate_sections ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.estimate_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 253 (class 1259 OID 17004)
-- Name: estimates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estimates (
    id bigint NOT NULL,
    estimate_no text NOT NULL,
    client_id bigint NOT NULL,
    project_id bigint,
    title text,
    status public.estimate_status DEFAULT 'DRAFT'::public.estimate_status NOT NULL,
    current_revision_id bigint,
    created_by bigint NOT NULL,
    approved_by bigint,
    approved_at timestamp with time zone,
    sent_at timestamp with time zone,
    memo text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    business_state public.estimate_business_state DEFAULT 'ONGOING'::public.estimate_business_state NOT NULL,
    receiver_name text
);


ALTER TABLE public.estimates OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 17003)
-- Name: estimates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estimates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estimates_id_seq OWNER TO postgres;

--
-- TOC entry 5649 (class 0 OID 0)
-- Dependencies: 252
-- Name: estimates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estimates_id_seq OWNED BY public.estimates.id;


--
-- TOC entry 249 (class 1259 OID 16943)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    product_id bigint NOT NULL,
    qty_on_hand numeric(14,2) DEFAULT 0 NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16942)
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_id_seq OWNER TO postgres;

--
-- TOC entry 5652 (class 0 OID 0)
-- Dependencies: 248
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- TOC entry 282 (class 1259 OID 17535)
-- Name: leave_entitlements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leave_entitlements (
    user_id integer NOT NULL,
    annual_leave_total integer DEFAULT 15 NOT NULL
);


ALTER TABLE public.leave_entitlements OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 17337)
-- Name: maintenance_tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintenance_tickets (
    id bigint NOT NULL,
    ticket_no text NOT NULL,
    client_id bigint NOT NULL,
    project_id bigint,
    title text NOT NULL,
    description text,
    priority public.ticket_priority DEFAULT 'MID'::public.ticket_priority NOT NULL,
    status public.ticket_status DEFAULT 'OPEN'::public.ticket_status NOT NULL,
    assignee_user_id bigint,
    requested_at timestamp with time zone DEFAULT now() NOT NULL,
    due_date date,
    closed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.maintenance_tickets OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17336)
-- Name: maintenance_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maintenance_tickets_id_seq OWNER TO postgres;

--
-- TOC entry 5656 (class 0 OID 0)
-- Dependencies: 270
-- Name: maintenance_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_tickets_id_seq OWNED BY public.maintenance_tickets.id;


--
-- TOC entry 269 (class 1259 OID 17290)
-- Name: material_request_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_request_items (
    id bigint NOT NULL,
    material_request_id bigint NOT NULL,
    line_no integer DEFAULT 1 NOT NULL,
    source public.mr_source DEFAULT 'MANUAL_TEXT'::public.mr_source NOT NULL,
    item_category public.item_category DEFAULT 'MATERIAL'::public.item_category NOT NULL,
    estimate_item_id bigint,
    product_id bigint,
    design_item_id bigint,
    item_name_snapshot text NOT NULL,
    spec_snapshot text,
    unit_snapshot text DEFAULT 'EA'::text NOT NULL,
    qty_requested numeric(14,2) DEFAULT 1 NOT NULL,
    qty_available_snapshot numeric(14,2),
    need_to_order boolean,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.material_request_items OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17289)
-- Name: material_request_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_request_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.material_request_items_id_seq OWNER TO postgres;

--
-- TOC entry 5659 (class 0 OID 0)
-- Dependencies: 268
-- Name: material_request_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_request_items_id_seq OWNED BY public.material_request_items.id;


--
-- TOC entry 267 (class 1259 OID 17236)
-- Name: material_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_requests (
    id bigint NOT NULL,
    request_no text NOT NULL,
    project_id bigint,
    client_id bigint,
    estimate_id bigint,
    estimate_revision_id bigint,
    status public.mr_status DEFAULT 'DRAFT'::public.mr_status NOT NULL,
    requested_by bigint NOT NULL,
    requested_at timestamp with time zone,
    approved_by bigint,
    approved_at timestamp with time zone,
    memo text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.material_requests OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17235)
-- Name: material_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.material_requests_id_seq OWNER TO postgres;

--
-- TOC entry 5662 (class 0 OID 0)
-- Dependencies: 266
-- Name: material_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_requests_id_seq OWNED BY public.material_requests.id;


--
-- TOC entry 278 (class 1259 OID 17440)
-- Name: performance_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.performance_reviews (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    year integer NOT NULL,
    score numeric(6,2) DEFAULT 0 NOT NULL,
    comment text,
    created_by bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.performance_reviews OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 17439)
-- Name: performance_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.performance_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.performance_reviews_id_seq OWNER TO postgres;

--
-- TOC entry 5665 (class 0 OID 0)
-- Dependencies: 277
-- Name: performance_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.performance_reviews_id_seq OWNED BY public.performance_reviews.id;


--
-- TOC entry 222 (class 1259 OID 16564)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    code text NOT NULL,
    module text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16563)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 5668 (class 0 OID 0)
-- Dependencies: 221
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 276 (class 1259 OID 17422)
-- Name: post_tag_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_tag_map (
    post_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.post_tag_map OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 17410)
-- Name: post_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_tags (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.post_tags OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 17409)
-- Name: post_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_tags_id_seq OWNER TO postgres;

--
-- TOC entry 5672 (class 0 OID 0)
-- Dependencies: 274
-- Name: post_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_tags_id_seq OWNED BY public.post_tags.id;


--
-- TOC entry 273 (class 1259 OID 17382)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    category public.post_category NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    author_user_id bigint NOT NULL,
    is_pinned boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 17381)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO postgres;

--
-- TOC entry 5675 (class 0 OID 0)
-- Dependencies: 272
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 245 (class 1259 OID 16898)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    sku text,
    name text NOT NULL,
    spec text,
    unit text DEFAULT 'EA'::text NOT NULL,
    vendor text,
    cost_price numeric(14,2),
    price_design numeric(14,2) DEFAULT 0 NOT NULL,
    price_consumer numeric(14,2) DEFAULT 0 NOT NULL,
    price_supply numeric(14,2) DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    memo text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16897)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 5678 (class 0 OID 0)
-- Dependencies: 244
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 289 (class 1259 OID 17742)
-- Name: project_admin_finance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_admin_finance (
    project_id integer NOT NULL,
    cost_material double precision,
    cost_labor double precision,
    cost_office double precision,
    cost_other double precision,
    sales_cost double precision,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.project_admin_finance OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 17585)
-- Name: project_business_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_business_types (
    id bigint NOT NULL,
    name text NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    memo text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    number integer DEFAULT 0
);


ALTER TABLE public.project_business_types OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 17584)
-- Name: project_business_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_business_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_business_types_id_seq OWNER TO postgres;

--
-- TOC entry 5682 (class 0 OID 0)
-- Dependencies: 283
-- Name: project_business_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_business_types_id_seq OWNED BY public.project_business_types.id;


--
-- TOC entry 288 (class 1259 OID 17656)
-- Name: project_evaluations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_evaluations (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    user_id bigint NOT NULL,
    score numeric(4,1) NOT NULL,
    comment text,
    created_by bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT project_evaluations_score_chk CHECK (((score >= (0)::numeric) AND (score <= (10)::numeric)))
);


ALTER TABLE public.project_evaluations OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 17655)
-- Name: project_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_evaluations_id_seq OWNER TO postgres;

--
-- TOC entry 5685 (class 0 OID 0)
-- Dependencies: 287
-- Name: project_evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_evaluations_id_seq OWNED BY public.project_evaluations.id;


--
-- TOC entry 241 (class 1259 OID 16837)
-- Name: project_finance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_finance (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    contract_amount numeric(14,2) DEFAULT 0 NOT NULL,
    billed_amount numeric(14,2) DEFAULT 0 NOT NULL,
    received_amount numeric(14,2) DEFAULT 0 NOT NULL,
    outstanding_amount numeric(14,2) DEFAULT 0 NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.project_finance OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16836)
-- Name: project_finance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_finance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_finance_id_seq OWNER TO postgres;

--
-- TOC entry 5688 (class 0 OID 0)
-- Dependencies: 240
-- Name: project_finance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_finance_id_seq OWNED BY public.project_finance.id;


--
-- TOC entry 243 (class 1259 OID 16863)
-- Name: project_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_members (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    user_id bigint NOT NULL,
    department_id bigint,
    role_in_project text,
    joined_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.project_members OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16862)
-- Name: project_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_members_id_seq OWNER TO postgres;

--
-- TOC entry 5691 (class 0 OID 0)
-- Dependencies: 242
-- Name: project_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_members_id_seq OWNED BY public.project_members.id;


--
-- TOC entry 239 (class 1259 OID 16798)
-- Name: project_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_tasks (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    department_id bigint NOT NULL,
    title text NOT NULL,
    status public.task_status DEFAULT 'TODO'::public.task_status NOT NULL,
    assignee_user_id bigint,
    due_date date,
    priority text,
    note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.project_tasks OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16797)
-- Name: project_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_tasks_id_seq OWNER TO postgres;

--
-- TOC entry 5694 (class 0 OID 0)
-- Dependencies: 238
-- Name: project_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_tasks_id_seq OWNED BY public.project_tasks.id;


--
-- TOC entry 286 (class 1259 OID 17622)
-- Name: project_updates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_updates (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    department_id bigint,
    content text NOT NULL,
    created_by bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.project_updates OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 17621)
-- Name: project_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_updates_id_seq OWNER TO postgres;

--
-- TOC entry 5697 (class 0 OID 0)
-- Dependencies: 285
-- Name: project_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_updates_id_seq OWNED BY public.project_updates.id;


--
-- TOC entry 237 (class 1259 OID 16766)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    code text,
    name text NOT NULL,
    client_id bigint NOT NULL,
    pm_user_id bigint,
    status public.project_status DEFAULT 'PLANNING'::public.project_status NOT NULL,
    start_date date,
    due_date date,
    end_date date,
    contract_amount numeric(14,2),
    memo text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    department_id bigint,
    business_type_id bigint,
    has_unread_update boolean DEFAULT false NOT NULL,
    admin_last_seen_at timestamp with time zone,
    admin_last_seen_by bigint,
    created_by integer,
    project_period_days numeric,
    difficulty numeric,
    progress_step numeric,
    participant_count integer,
    profit_rate numeric,
    cost_progress numeric,
    cost_other_note text,
    other_note text
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16765)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- TOC entry 5700 (class 0 OID 0)
-- Dependencies: 236
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 223 (class 1259 OID 16580)
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16548)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    code public.role_code NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16547)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5704 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 281 (class 1259 OID 17525)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    key text NOT NULL,
    value_json text DEFAULT '{}'::text NOT NULL
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16970)
-- Name: stock_movements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_movements (
    id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    product_id bigint NOT NULL,
    movement_type public.movement_type NOT NULL,
    qty numeric(14,2) NOT NULL,
    reference_type text,
    reference_id text,
    note text,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.stock_movements OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16969)
-- Name: stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_movements_id_seq OWNER TO postgres;

--
-- TOC entry 5708 (class 0 OID 0)
-- Dependencies: 250
-- Name: stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_movements_id_seq OWNED BY public.stock_movements.id;


--
-- TOC entry 227 (class 1259 OID 16616)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email text NOT NULL,
    password_hash text NOT NULL,
    name text NOT NULL,
    phone text,
    role_id bigint NOT NULL,
    department_id bigint,
    status text DEFAULT 'active'::text NOT NULL,
    last_login_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    current_session_id text,
    current_device_id text,
    current_device_name text,
    current_device_ua text,
    current_login_at timestamp with time zone,
    current_last_seen_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16615)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5711 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 265 (class 1259 OID 17214)
-- Name: wage_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wage_items (
    id bigint NOT NULL,
    wage_table_id bigint NOT NULL,
    job_code text NOT NULL,
    job_name text NOT NULL,
    unit_price numeric(14,2) DEFAULT 0 NOT NULL,
    note text
);


ALTER TABLE public.wage_items OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 17213)
-- Name: wage_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wage_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wage_items_id_seq OWNER TO postgres;

--
-- TOC entry 5714 (class 0 OID 0)
-- Dependencies: 264
-- Name: wage_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wage_items_id_seq OWNED BY public.wage_items.id;


--
-- TOC entry 263 (class 1259 OID 17196)
-- Name: wage_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wage_tables (
    id bigint NOT NULL,
    year integer NOT NULL,
    name text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.wage_tables OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17195)
-- Name: wage_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wage_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wage_tables_id_seq OWNER TO postgres;

--
-- TOC entry 5717 (class 0 OID 0)
-- Dependencies: 262
-- Name: wage_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wage_tables_id_seq OWNED BY public.wage_tables.id;


--
-- TOC entry 247 (class 1259 OID 16928)
-- Name: warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses (
    id bigint NOT NULL,
    name text NOT NULL,
    location text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.warehouses OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16927)
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warehouses_id_seq OWNER TO postgres;

--
-- TOC entry 5720 (class 0 OID 0)
-- Dependencies: 246
-- Name: warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;


--
-- TOC entry 280 (class 1259 OID 17494)
-- Name: work_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    session_type character varying(20) NOT NULL,
    shift_type character varying(10) NOT NULL,
    start_at timestamp with time zone NOT NULL,
    end_at timestamp with time zone,
    work_date_basis date NOT NULL,
    place text,
    task text,
    is_holiday boolean DEFAULT false NOT NULL,
    source character varying(20) DEFAULT 'manual'::character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT work_sessions_shift_type_check CHECK (((shift_type)::text = ANY ((ARRAY['DAY'::character varying, 'NIGHT'::character varying])::text[])))
);


ALTER TABLE public.work_sessions OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 17493)
-- Name: work_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.work_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.work_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 5723 (class 0 OID 0)
-- Dependencies: 279
-- Name: work_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.work_sessions_id_seq OWNED BY public.work_sessions.id;


--
-- TOC entry 5082 (class 2604 OID 16739)
-- Name: attendance_corrections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_corrections ALTER COLUMN id SET DEFAULT nextval('public.attendance_corrections_id_seq'::regclass);


--
-- TOC entry 5076 (class 2604 OID 16694)
-- Name: attendance_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_records ALTER COLUMN id SET DEFAULT nextval('public.attendance_records_id_seq'::regclass);


--
-- TOC entry 5074 (class 2604 OID 16671)
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- TOC entry 5069 (class 2604 OID 16653)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 5062 (class 2604 OID 16601)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 5142 (class 2604 OID 17168)
-- Name: design_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_items ALTER COLUMN id SET DEFAULT nextval('public.design_items_id_seq'::regclass);


--
-- TOC entry 5138 (class 2604 OID 17133)
-- Name: design_packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_packages ALTER COLUMN id SET DEFAULT nextval('public.design_packages_id_seq'::regclass);


--
-- TOC entry 5130 (class 2604 OID 17094)
-- Name: estimate_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_items ALTER COLUMN id SET DEFAULT nextval('public.estimate_items_id_seq'::regclass);


--
-- TOC entry 5124 (class 2604 OID 17052)
-- Name: estimate_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_revisions ALTER COLUMN id SET DEFAULT nextval('public.estimate_revisions_id_seq'::regclass);


--
-- TOC entry 5119 (class 2604 OID 17007)
-- Name: estimates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimates ALTER COLUMN id SET DEFAULT nextval('public.estimates_id_seq'::regclass);


--
-- TOC entry 5114 (class 2604 OID 16946)
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);


--
-- TOC entry 5165 (class 2604 OID 17340)
-- Name: maintenance_tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_tickets ALTER COLUMN id SET DEFAULT nextval('public.maintenance_tickets_id_seq'::regclass);


--
-- TOC entry 5158 (class 2604 OID 17293)
-- Name: material_request_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_request_items ALTER COLUMN id SET DEFAULT nextval('public.material_request_items_id_seq'::regclass);


--
-- TOC entry 5154 (class 2604 OID 17239)
-- Name: material_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests ALTER COLUMN id SET DEFAULT nextval('public.material_requests_id_seq'::regclass);


--
-- TOC entry 5176 (class 2604 OID 17443)
-- Name: performance_reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performance_reviews ALTER COLUMN id SET DEFAULT nextval('public.performance_reviews_id_seq'::regclass);


--
-- TOC entry 5060 (class 2604 OID 16567)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 5175 (class 2604 OID 17413)
-- Name: post_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tags ALTER COLUMN id SET DEFAULT nextval('public.post_tags_id_seq'::regclass);


--
-- TOC entry 5171 (class 2604 OID 17385)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 5103 (class 2604 OID 16901)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 5186 (class 2604 OID 17588)
-- Name: project_business_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_business_types ALTER COLUMN id SET DEFAULT nextval('public.project_business_types_id_seq'::regclass);


--
-- TOC entry 5195 (class 2604 OID 17659)
-- Name: project_evaluations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_evaluations ALTER COLUMN id SET DEFAULT nextval('public.project_evaluations_id_seq'::regclass);


--
-- TOC entry 5094 (class 2604 OID 16840)
-- Name: project_finance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_finance ALTER COLUMN id SET DEFAULT nextval('public.project_finance_id_seq'::regclass);


--
-- TOC entry 5100 (class 2604 OID 16866)
-- Name: project_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_members ALTER COLUMN id SET DEFAULT nextval('public.project_members_id_seq'::regclass);


--
-- TOC entry 5090 (class 2604 OID 16801)
-- Name: project_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_tasks ALTER COLUMN id SET DEFAULT nextval('public.project_tasks_id_seq'::regclass);


--
-- TOC entry 5192 (class 2604 OID 17625)
-- Name: project_updates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_updates ALTER COLUMN id SET DEFAULT nextval('public.project_updates_id_seq'::regclass);


--
-- TOC entry 5085 (class 2604 OID 16769)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 5058 (class 2604 OID 16551)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 5117 (class 2604 OID 16973)
-- Name: stock_movements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movements ALTER COLUMN id SET DEFAULT nextval('public.stock_movements_id_seq'::regclass);


--
-- TOC entry 5065 (class 2604 OID 16619)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5152 (class 2604 OID 17217)
-- Name: wage_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wage_items ALTER COLUMN id SET DEFAULT nextval('public.wage_items_id_seq'::regclass);


--
-- TOC entry 5149 (class 2604 OID 17199)
-- Name: wage_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wage_tables ALTER COLUMN id SET DEFAULT nextval('public.wage_tables_id_seq'::regclass);


--
-- TOC entry 5111 (class 2604 OID 16931)
-- Name: warehouses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);


--
-- TOC entry 5179 (class 2604 OID 17497)
-- Name: work_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_sessions ALTER COLUMN id SET DEFAULT nextval('public.work_sessions_id_seq'::regclass);


--
-- TOC entry 5244 (class 2606 OID 16752)
-- Name: attendance_corrections attendance_corrections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_corrections
    ADD CONSTRAINT attendance_corrections_pkey PRIMARY KEY (id);


--
-- TOC entry 5233 (class 2606 OID 16713)
-- Name: attendance_records attendance_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_records
    ADD CONSTRAINT attendance_records_pkey PRIMARY KEY (id);


--
-- TOC entry 5228 (class 2606 OID 16681)
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 5225 (class 2606 OID 16665)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 5215 (class 2606 OID 16614)
-- Name: departments departments_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_code_key UNIQUE (code);


--
-- TOC entry 5217 (class 2606 OID 16612)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 5316 (class 2606 OID 17187)
-- Name: design_items design_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_items
    ADD CONSTRAINT design_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5312 (class 2606 OID 17146)
-- Name: design_packages design_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_packages
    ADD CONSTRAINT design_packages_pkey PRIMARY KEY (id);


--
-- TOC entry 5304 (class 2606 OID 17115)
-- Name: estimate_items estimate_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_items
    ADD CONSTRAINT estimate_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5298 (class 2606 OID 17070)
-- Name: estimate_revisions estimate_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_revisions
    ADD CONSTRAINT estimate_revisions_pkey PRIMARY KEY (id);


--
-- TOC entry 5387 (class 2606 OID 17869)
-- Name: estimate_sections estimate_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_sections
    ADD CONSTRAINT estimate_sections_pkey PRIMARY KEY (id);


--
-- TOC entry 5290 (class 2606 OID 17023)
-- Name: estimates estimates_estimate_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT estimates_estimate_no_key UNIQUE (estimate_no);


--
-- TOC entry 5292 (class 2606 OID 17021)
-- Name: estimates estimates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT estimates_pkey PRIMARY KEY (id);


--
-- TOC entry 5281 (class 2606 OID 16955)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 5373 (class 2606 OID 17542)
-- Name: leave_entitlements leave_entitlements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leave_entitlements
    ADD CONSTRAINT leave_entitlements_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5346 (class 2606 OID 17358)
-- Name: maintenance_tickets maintenance_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_tickets
    ADD CONSTRAINT maintenance_tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 5348 (class 2606 OID 17360)
-- Name: maintenance_tickets maintenance_tickets_ticket_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_tickets
    ADD CONSTRAINT maintenance_tickets_ticket_no_key UNIQUE (ticket_no);


--
-- TOC entry 5339 (class 2606 OID 17312)
-- Name: material_request_items material_request_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_request_items
    ADD CONSTRAINT material_request_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5332 (class 2606 OID 17252)
-- Name: material_requests material_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests
    ADD CONSTRAINT material_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 5334 (class 2606 OID 17254)
-- Name: material_requests material_requests_request_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests
    ADD CONSTRAINT material_requests_request_no_key UNIQUE (request_no);


--
-- TOC entry 5363 (class 2606 OID 17455)
-- Name: performance_reviews performance_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performance_reviews
    ADD CONSTRAINT performance_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 5209 (class 2606 OID 16579)
-- Name: permissions permissions_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_code_key UNIQUE (code);


--
-- TOC entry 5211 (class 2606 OID 16577)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5359 (class 2606 OID 17428)
-- Name: post_tag_map post_tag_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tag_map
    ADD CONSTRAINT post_tag_map_pkey PRIMARY KEY (post_id, tag_id);


--
-- TOC entry 5355 (class 2606 OID 17421)
-- Name: post_tags post_tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_name_key UNIQUE (name);


--
-- TOC entry 5357 (class 2606 OID 17419)
-- Name: post_tags post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5353 (class 2606 OID 17400)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 5274 (class 2606 OID 16921)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 5276 (class 2606 OID 16923)
-- Name: products products_sku_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_sku_key UNIQUE (sku);


--
-- TOC entry 5385 (class 2606 OID 17751)
-- Name: project_admin_finance project_admin_finance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_admin_finance
    ADD CONSTRAINT project_admin_finance_pkey PRIMARY KEY (project_id);


--
-- TOC entry 5376 (class 2606 OID 17602)
-- Name: project_business_types project_business_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_business_types
    ADD CONSTRAINT project_business_types_pkey PRIMARY KEY (id);


--
-- TOC entry 5382 (class 2606 OID 17673)
-- Name: project_evaluations project_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_evaluations
    ADD CONSTRAINT project_evaluations_pkey PRIMARY KEY (id);


--
-- TOC entry 5261 (class 2606 OID 16854)
-- Name: project_finance project_finance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_finance
    ADD CONSTRAINT project_finance_pkey PRIMARY KEY (id);


--
-- TOC entry 5263 (class 2606 OID 16856)
-- Name: project_finance project_finance_project_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_finance
    ADD CONSTRAINT project_finance_project_id_key UNIQUE (project_id);


--
-- TOC entry 5267 (class 2606 OID 16877)
-- Name: project_members project_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT project_members_pkey PRIMARY KEY (id);


--
-- TOC entry 5259 (class 2606 OID 16815)
-- Name: project_tasks project_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_tasks
    ADD CONSTRAINT project_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 5379 (class 2606 OID 17637)
-- Name: project_updates project_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_updates
    ADD CONSTRAINT project_updates_pkey PRIMARY KEY (id);


--
-- TOC entry 5252 (class 2606 OID 16782)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 5213 (class 2606 OID 16586)
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 5205 (class 2606 OID 16562)
-- Name: roles roles_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_code_key UNIQUE (code);


--
-- TOC entry 5207 (class 2606 OID 16560)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5371 (class 2606 OID 17534)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (key);


--
-- TOC entry 5288 (class 2606 OID 16984)
-- Name: stock_movements stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_pkey PRIMARY KEY (id);


--
-- TOC entry 5241 (class 2606 OID 16715)
-- Name: attendance_records uq_attendance_user_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_records
    ADD CONSTRAINT uq_attendance_user_date UNIQUE (user_id, work_date);


--
-- TOC entry 5302 (class 2606 OID 17072)
-- Name: estimate_revisions uq_est_rev; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_revisions
    ADD CONSTRAINT uq_est_rev UNIQUE (estimate_id, revision_no);


--
-- TOC entry 5310 (class 2606 OID 17887)
-- Name: estimate_items uq_estimate_items_section_line_order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_items
    ADD CONSTRAINT uq_estimate_items_section_line_order UNIQUE (section_id, line_order);


--
-- TOC entry 5391 (class 2606 OID 17885)
-- Name: estimate_sections uq_estimate_sections_revision_order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_sections
    ADD CONSTRAINT uq_estimate_sections_revision_order UNIQUE (revision_id, section_order);


--
-- TOC entry 5283 (class 2606 OID 16957)
-- Name: inventory uq_inventory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT uq_inventory UNIQUE (warehouse_id, product_id);


--
-- TOC entry 5269 (class 2606 OID 16879)
-- Name: project_members uq_project_member; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT uq_project_member UNIQUE (project_id, user_id);


--
-- TOC entry 5365 (class 2606 OID 17457)
-- Name: performance_reviews uq_review_user_year; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performance_reviews
    ADD CONSTRAINT uq_review_user_year UNIQUE (user_id, year);


--
-- TOC entry 5221 (class 2606 OID 16636)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 5223 (class 2606 OID 16634)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5326 (class 2606 OID 17227)
-- Name: wage_items wage_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wage_items
    ADD CONSTRAINT wage_items_pkey PRIMARY KEY (id);


--
-- TOC entry 5320 (class 2606 OID 17210)
-- Name: wage_tables wage_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wage_tables
    ADD CONSTRAINT wage_tables_pkey PRIMARY KEY (id);


--
-- TOC entry 5322 (class 2606 OID 17212)
-- Name: wage_tables wage_tables_year_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wage_tables
    ADD CONSTRAINT wage_tables_year_key UNIQUE (year);


--
-- TOC entry 5278 (class 2606 OID 16941)
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);


--
-- TOC entry 5369 (class 2606 OID 17517)
-- Name: work_sessions work_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_sessions
    ADD CONSTRAINT work_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 5245 (class 1259 OID 16764)
-- Name: idx_att_corr_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_att_corr_status ON public.attendance_corrections USING btree (status);


--
-- TOC entry 5246 (class 1259 OID 16763)
-- Name: idx_att_corr_user_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_att_corr_user_date ON public.attendance_corrections USING btree (user_id, work_date);


--
-- TOC entry 5234 (class 1259 OID 16734)
-- Name: idx_attendance_holiday; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attendance_holiday ON public.attendance_records USING btree (is_holiday_work);


--
-- TOC entry 5235 (class 1259 OID 16733)
-- Name: idx_attendance_shift; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attendance_shift ON public.attendance_records USING btree (shift_type);


--
-- TOC entry 5236 (class 1259 OID 16732)
-- Name: idx_attendance_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attendance_status ON public.attendance_records USING btree (status);


--
-- TOC entry 5237 (class 1259 OID 16731)
-- Name: idx_attendance_work_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attendance_work_date ON public.attendance_records USING btree (work_date);


--
-- TOC entry 5229 (class 1259 OID 16688)
-- Name: idx_audit_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_actor ON public.audit_logs USING btree (actor_user_id);


--
-- TOC entry 5230 (class 1259 OID 16689)
-- Name: idx_audit_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_created ON public.audit_logs USING btree (created_at);


--
-- TOC entry 5231 (class 1259 OID 16687)
-- Name: idx_audit_entity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_entity ON public.audit_logs USING btree (entity_type, entity_id);


--
-- TOC entry 5226 (class 1259 OID 16666)
-- Name: idx_clients_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clients_name ON public.clients USING btree (name);


--
-- TOC entry 5317 (class 1259 OID 17194)
-- Name: idx_di_cat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_di_cat ON public.design_items USING btree (item_category);


--
-- TOC entry 5318 (class 1259 OID 17193)
-- Name: idx_di_package; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_di_package ON public.design_items USING btree (package_id);


--
-- TOC entry 5313 (class 1259 OID 17163)
-- Name: idx_dp_estimate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dp_estimate ON public.design_packages USING btree (estimate_id);


--
-- TOC entry 5314 (class 1259 OID 17162)
-- Name: idx_dp_project; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dp_project ON public.design_packages USING btree (project_id);


--
-- TOC entry 5305 (class 1259 OID 17127)
-- Name: idx_ei_cat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ei_cat ON public.estimate_items USING btree (item_category);


--
-- TOC entry 5306 (class 1259 OID 17128)
-- Name: idx_ei_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ei_product ON public.estimate_items USING btree (product_id);


--
-- TOC entry 5307 (class 1259 OID 17126)
-- Name: idx_ei_rev; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ei_rev ON public.estimate_items USING btree (revision_id);


--
-- TOC entry 5293 (class 1259 OID 17044)
-- Name: idx_est_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_est_client ON public.estimates USING btree (client_id);


--
-- TOC entry 5294 (class 1259 OID 17045)
-- Name: idx_est_project; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_est_project ON public.estimates USING btree (project_id);


--
-- TOC entry 5295 (class 1259 OID 17047)
-- Name: idx_est_sent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_est_sent ON public.estimates USING btree (sent_at);


--
-- TOC entry 5296 (class 1259 OID 17046)
-- Name: idx_est_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_est_status ON public.estimates USING btree (status);


--
-- TOC entry 5308 (class 1259 OID 17891)
-- Name: idx_estimate_items_section_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_estimate_items_section_order ON public.estimate_items USING btree (section_id, line_order);


--
-- TOC entry 5388 (class 1259 OID 17890)
-- Name: idx_estimate_sections_revision_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_estimate_sections_revision_order ON public.estimate_sections USING btree (revision_id, section_order);


--
-- TOC entry 5279 (class 1259 OID 16968)
-- Name: idx_inventory_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_inventory_product ON public.inventory USING btree (product_id);


--
-- TOC entry 5327 (class 1259 OID 17287)
-- Name: idx_mr_est_rev; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mr_est_rev ON public.material_requests USING btree (estimate_revision_id);


--
-- TOC entry 5328 (class 1259 OID 17286)
-- Name: idx_mr_project; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mr_project ON public.material_requests USING btree (project_id);


--
-- TOC entry 5329 (class 1259 OID 17288)
-- Name: idx_mr_requested_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mr_requested_at ON public.material_requests USING btree (requested_at);


--
-- TOC entry 5330 (class 1259 OID 17285)
-- Name: idx_mr_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mr_status ON public.material_requests USING btree (status);


--
-- TOC entry 5335 (class 1259 OID 17334)
-- Name: idx_mri_cat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mri_cat ON public.material_request_items USING btree (item_category);


--
-- TOC entry 5336 (class 1259 OID 17333)
-- Name: idx_mri_mr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mri_mr ON public.material_request_items USING btree (material_request_id);


--
-- TOC entry 5337 (class 1259 OID 17335)
-- Name: idx_mri_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mri_product ON public.material_request_items USING btree (product_id);


--
-- TOC entry 5340 (class 1259 OID 17378)
-- Name: idx_mt_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mt_client ON public.maintenance_tickets USING btree (client_id);


--
-- TOC entry 5341 (class 1259 OID 17377)
-- Name: idx_mt_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mt_priority ON public.maintenance_tickets USING btree (priority);


--
-- TOC entry 5342 (class 1259 OID 17379)
-- Name: idx_mt_project; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mt_project ON public.maintenance_tickets USING btree (project_id);


--
-- TOC entry 5343 (class 1259 OID 17380)
-- Name: idx_mt_requested; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mt_requested ON public.maintenance_tickets USING btree (requested_at);


--
-- TOC entry 5344 (class 1259 OID 17376)
-- Name: idx_mt_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mt_status ON public.maintenance_tickets USING btree (status);


--
-- TOC entry 5264 (class 1259 OID 16895)
-- Name: idx_pm_project; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pm_project ON public.project_members USING btree (project_id);


--
-- TOC entry 5265 (class 1259 OID 16896)
-- Name: idx_pm_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pm_user ON public.project_members USING btree (user_id);


--
-- TOC entry 5349 (class 1259 OID 17408)
-- Name: idx_posts_author; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_posts_author ON public.posts USING btree (author_user_id);


--
-- TOC entry 5350 (class 1259 OID 17406)
-- Name: idx_posts_cat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_posts_cat ON public.posts USING btree (category);


--
-- TOC entry 5351 (class 1259 OID 17407)
-- Name: idx_posts_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_posts_created ON public.posts USING btree (created_at);


--
-- TOC entry 5270 (class 1259 OID 16925)
-- Name: idx_products_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_active ON public.products USING btree (is_active);


--
-- TOC entry 5271 (class 1259 OID 16924)
-- Name: idx_products_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_name ON public.products USING btree (name);


--
-- TOC entry 5272 (class 1259 OID 16926)
-- Name: idx_products_vendor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_vendor ON public.products USING btree (vendor);


--
-- TOC entry 5247 (class 1259 OID 16793)
-- Name: idx_projects_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_projects_client ON public.projects USING btree (client_id);


--
-- TOC entry 5248 (class 1259 OID 16796)
-- Name: idx_projects_due; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_projects_due ON public.projects USING btree (due_date);


--
-- TOC entry 5249 (class 1259 OID 16795)
-- Name: idx_projects_pm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_projects_pm ON public.projects USING btree (pm_user_id);


--
-- TOC entry 5250 (class 1259 OID 16794)
-- Name: idx_projects_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_projects_status ON public.projects USING btree (status);


--
-- TOC entry 5253 (class 1259 OID 16833)
-- Name: idx_pt_assignee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pt_assignee ON public.project_tasks USING btree (assignee_user_id);


--
-- TOC entry 5254 (class 1259 OID 16832)
-- Name: idx_pt_dept; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pt_dept ON public.project_tasks USING btree (department_id);


--
-- TOC entry 5255 (class 1259 OID 16835)
-- Name: idx_pt_due; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pt_due ON public.project_tasks USING btree (due_date);


--
-- TOC entry 5256 (class 1259 OID 16831)
-- Name: idx_pt_project; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pt_project ON public.project_tasks USING btree (project_id);


--
-- TOC entry 5257 (class 1259 OID 16834)
-- Name: idx_pt_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pt_status ON public.project_tasks USING btree (status);


--
-- TOC entry 5299 (class 1259 OID 17083)
-- Name: idx_rev_estimate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_rev_estimate ON public.estimate_revisions USING btree (estimate_id);


--
-- TOC entry 5300 (class 1259 OID 17084)
-- Name: idx_rev_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_rev_status ON public.estimate_revisions USING btree (status);


--
-- TOC entry 5360 (class 1259 OID 17469)
-- Name: idx_reviews_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reviews_user ON public.performance_reviews USING btree (user_id);


--
-- TOC entry 5361 (class 1259 OID 17468)
-- Name: idx_reviews_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reviews_year ON public.performance_reviews USING btree (year);


--
-- TOC entry 5284 (class 1259 OID 17002)
-- Name: idx_sm_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sm_created ON public.stock_movements USING btree (created_at);


--
-- TOC entry 5285 (class 1259 OID 17001)
-- Name: idx_sm_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sm_product ON public.stock_movements USING btree (product_id);


--
-- TOC entry 5286 (class 1259 OID 17000)
-- Name: idx_sm_wh; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sm_wh ON public.stock_movements USING btree (warehouse_id);


--
-- TOC entry 5218 (class 1259 OID 16648)
-- Name: idx_users_dept; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_dept ON public.users USING btree (department_id);


--
-- TOC entry 5219 (class 1259 OID 16647)
-- Name: idx_users_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_role ON public.users USING btree (role_id);


--
-- TOC entry 5323 (class 1259 OID 17234)
-- Name: idx_wi_job_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wi_job_code ON public.wage_items USING btree (job_code);


--
-- TOC entry 5324 (class 1259 OID 17233)
-- Name: idx_wi_table; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_wi_table ON public.wage_items USING btree (wage_table_id);


--
-- TOC entry 5366 (class 1259 OID 17524)
-- Name: idx_work_sessions_user_basis; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_work_sessions_user_basis ON public.work_sessions USING btree (user_id, work_date_basis);


--
-- TOC entry 5367 (class 1259 OID 17523)
-- Name: idx_work_sessions_user_start; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_work_sessions_user_start ON public.work_sessions USING btree (user_id, start_at);


--
-- TOC entry 5238 (class 1259 OID 17477)
-- Name: ix_attendance_basis; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_attendance_basis ON public.attendance_records USING btree (work_date_basis);


--
-- TOC entry 5239 (class 1259 OID 17475)
-- Name: ix_attendance_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_attendance_user ON public.attendance_records USING btree (user_id);


--
-- TOC entry 5389 (class 1259 OID 17875)
-- Name: ix_estimate_sections_revision_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_estimate_sections_revision_order ON public.estimate_sections USING btree (revision_id, section_order);


--
-- TOC entry 5374 (class 1259 OID 17603)
-- Name: project_business_types_name_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX project_business_types_name_uniq ON public.project_business_types USING btree (name) WHERE (deleted_at IS NULL);


--
-- TOC entry 5383 (class 1259 OID 17689)
-- Name: project_evaluations_project_user_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX project_evaluations_project_user_uniq ON public.project_evaluations USING btree (project_id, user_id) WHERE (deleted_at IS NULL);


--
-- TOC entry 5377 (class 1259 OID 17654)
-- Name: project_updates_department_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX project_updates_department_id_idx ON public.project_updates USING btree (department_id);


--
-- TOC entry 5380 (class 1259 OID 17653)
-- Name: project_updates_project_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX project_updates_project_id_idx ON public.project_updates USING btree (project_id);


--
-- TOC entry 5242 (class 1259 OID 17476)
-- Name: ux_attendance_user_basis; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ux_attendance_user_basis ON public.attendance_records USING btree (user_id, work_date_basis);


--
-- TOC entry 5463 (class 2620 OID 17889)
-- Name: estimate_items estimate_items_sync_revision; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER estimate_items_sync_revision BEFORE INSERT OR UPDATE OF section_id ON public.estimate_items FOR EACH ROW EXECUTE FUNCTION public.trg_estimate_items_sync_revision();


--
-- TOC entry 5461 (class 2620 OID 17546)
-- Name: attendance_corrections trg_attendance_corrections_fill_required_fields; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_attendance_corrections_fill_required_fields BEFORE INSERT ON public.attendance_corrections FOR EACH ROW EXECUTE FUNCTION public.attendance_corrections_fill_required_fields_jsonb();


--
-- TOC entry 5462 (class 2620 OID 17544)
-- Name: attendance_corrections trg_attendance_corrections_fill_work_date; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_attendance_corrections_fill_work_date BEFORE INSERT ON public.attendance_corrections FOR EACH ROW EXECUTE FUNCTION public.attendance_corrections_fill_work_date();


--
-- TOC entry 5464 (class 2620 OID 17898)
-- Name: estimate_items trg_estimate_items_revision_match; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_estimate_items_revision_match BEFORE INSERT OR UPDATE OF revision_id, section_id ON public.estimate_items FOR EACH ROW EXECUTE FUNCTION public.trg_estimate_items_revision_match();


--
-- TOC entry 5465 (class 2620 OID 17900)
-- Name: estimate_items trg_estimate_items_round_money; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_estimate_items_round_money BEFORE INSERT OR UPDATE OF line_total, unit_price_snapshot ON public.estimate_items FOR EACH ROW EXECUTE FUNCTION public.trg_estimate_items_round_money();


--
-- TOC entry 5400 (class 2606 OID 16758)
-- Name: attendance_corrections attendance_corrections_reviewed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_corrections
    ADD CONSTRAINT attendance_corrections_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES public.users(id);


--
-- TOC entry 5401 (class 2606 OID 16753)
-- Name: attendance_corrections attendance_corrections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_corrections
    ADD CONSTRAINT attendance_corrections_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5397 (class 2606 OID 16721)
-- Name: attendance_records attendance_records_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_records
    ADD CONSTRAINT attendance_records_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 5398 (class 2606 OID 16726)
-- Name: attendance_records attendance_records_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_records
    ADD CONSTRAINT attendance_records_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.users(id);


--
-- TOC entry 5399 (class 2606 OID 16716)
-- Name: attendance_records attendance_records_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_records
    ADD CONSTRAINT attendance_records_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5396 (class 2606 OID 16682)
-- Name: audit_logs audit_logs_actor_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_actor_user_id_fkey FOREIGN KEY (actor_user_id) REFERENCES public.users(id);


--
-- TOC entry 5432 (class 2606 OID 17188)
-- Name: design_items design_items_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_items
    ADD CONSTRAINT design_items_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.design_packages(id) ON DELETE CASCADE;


--
-- TOC entry 5429 (class 2606 OID 17157)
-- Name: design_packages design_packages_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_packages
    ADD CONSTRAINT design_packages_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 5430 (class 2606 OID 17152)
-- Name: design_packages design_packages_estimate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_packages
    ADD CONSTRAINT design_packages_estimate_id_fkey FOREIGN KEY (estimate_id) REFERENCES public.estimates(id);


--
-- TOC entry 5431 (class 2606 OID 17147)
-- Name: design_packages design_packages_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.design_packages
    ADD CONSTRAINT design_packages_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- TOC entry 5426 (class 2606 OID 17121)
-- Name: estimate_items estimate_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_items
    ADD CONSTRAINT estimate_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 5427 (class 2606 OID 17116)
-- Name: estimate_items estimate_items_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_items
    ADD CONSTRAINT estimate_items_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.estimate_revisions(id) ON DELETE CASCADE;


--
-- TOC entry 5428 (class 2606 OID 17892)
-- Name: estimate_items estimate_items_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_items
    ADD CONSTRAINT estimate_items_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.estimate_sections(id) ON DELETE CASCADE;


--
-- TOC entry 5424 (class 2606 OID 17078)
-- Name: estimate_revisions estimate_revisions_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_revisions
    ADD CONSTRAINT estimate_revisions_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 5425 (class 2606 OID 17073)
-- Name: estimate_revisions estimate_revisions_estimate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_revisions
    ADD CONSTRAINT estimate_revisions_estimate_id_fkey FOREIGN KEY (estimate_id) REFERENCES public.estimates(id) ON DELETE CASCADE;


--
-- TOC entry 5460 (class 2606 OID 17870)
-- Name: estimate_sections estimate_sections_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimate_sections
    ADD CONSTRAINT estimate_sections_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.estimate_revisions(id) ON DELETE CASCADE;


--
-- TOC entry 5419 (class 2606 OID 17039)
-- Name: estimates estimates_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT estimates_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES public.users(id);


--
-- TOC entry 5420 (class 2606 OID 17024)
-- Name: estimates estimates_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT estimates_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 5421 (class 2606 OID 17034)
-- Name: estimates estimates_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT estimates_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 5422 (class 2606 OID 17029)
-- Name: estimates estimates_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT estimates_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- TOC entry 5423 (class 2606 OID 17085)
-- Name: estimates fk_estimates_current_revision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estimates
    ADD CONSTRAINT fk_estimates_current_revision FOREIGN KEY (current_revision_id) REFERENCES public.estimate_revisions(id);


--
-- TOC entry 5414 (class 2606 OID 16963)
-- Name: inventory inventory_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 5415 (class 2606 OID 16958)
-- Name: inventory inventory_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(id) ON DELETE CASCADE;


--
-- TOC entry 5444 (class 2606 OID 17371)
-- Name: maintenance_tickets maintenance_tickets_assignee_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_tickets
    ADD CONSTRAINT maintenance_tickets_assignee_user_id_fkey FOREIGN KEY (assignee_user_id) REFERENCES public.users(id);


--
-- TOC entry 5445 (class 2606 OID 17361)
-- Name: maintenance_tickets maintenance_tickets_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_tickets
    ADD CONSTRAINT maintenance_tickets_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 5446 (class 2606 OID 17366)
-- Name: maintenance_tickets maintenance_tickets_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_tickets
    ADD CONSTRAINT maintenance_tickets_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- TOC entry 5440 (class 2606 OID 17328)
-- Name: material_request_items material_request_items_design_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_request_items
    ADD CONSTRAINT material_request_items_design_item_id_fkey FOREIGN KEY (design_item_id) REFERENCES public.design_items(id);


--
-- TOC entry 5441 (class 2606 OID 17318)
-- Name: material_request_items material_request_items_estimate_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_request_items
    ADD CONSTRAINT material_request_items_estimate_item_id_fkey FOREIGN KEY (estimate_item_id) REFERENCES public.estimate_items(id);


--
-- TOC entry 5442 (class 2606 OID 17313)
-- Name: material_request_items material_request_items_material_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_request_items
    ADD CONSTRAINT material_request_items_material_request_id_fkey FOREIGN KEY (material_request_id) REFERENCES public.material_requests(id) ON DELETE CASCADE;


--
-- TOC entry 5443 (class 2606 OID 17323)
-- Name: material_request_items material_request_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_request_items
    ADD CONSTRAINT material_request_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 5434 (class 2606 OID 17280)
-- Name: material_requests material_requests_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests
    ADD CONSTRAINT material_requests_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES public.users(id);


--
-- TOC entry 5435 (class 2606 OID 17260)
-- Name: material_requests material_requests_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests
    ADD CONSTRAINT material_requests_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 5436 (class 2606 OID 17265)
-- Name: material_requests material_requests_estimate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests
    ADD CONSTRAINT material_requests_estimate_id_fkey FOREIGN KEY (estimate_id) REFERENCES public.estimates(id);


--
-- TOC entry 5437 (class 2606 OID 17270)
-- Name: material_requests material_requests_estimate_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests
    ADD CONSTRAINT material_requests_estimate_revision_id_fkey FOREIGN KEY (estimate_revision_id) REFERENCES public.estimate_revisions(id);


--
-- TOC entry 5438 (class 2606 OID 17255)
-- Name: material_requests material_requests_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests
    ADD CONSTRAINT material_requests_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- TOC entry 5439 (class 2606 OID 17275)
-- Name: material_requests material_requests_requested_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_requests
    ADD CONSTRAINT material_requests_requested_by_fkey FOREIGN KEY (requested_by) REFERENCES public.users(id);


--
-- TOC entry 5450 (class 2606 OID 17463)
-- Name: performance_reviews performance_reviews_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performance_reviews
    ADD CONSTRAINT performance_reviews_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 5451 (class 2606 OID 17458)
-- Name: performance_reviews performance_reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performance_reviews
    ADD CONSTRAINT performance_reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5448 (class 2606 OID 17429)
-- Name: post_tag_map post_tag_map_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tag_map
    ADD CONSTRAINT post_tag_map_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- TOC entry 5449 (class 2606 OID 17434)
-- Name: post_tag_map post_tag_map_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_tag_map
    ADD CONSTRAINT post_tag_map_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.post_tags(id) ON DELETE CASCADE;


--
-- TOC entry 5447 (class 2606 OID 17401)
-- Name: posts posts_author_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_user_id_fkey FOREIGN KEY (author_user_id) REFERENCES public.users(id);


--
-- TOC entry 5459 (class 2606 OID 17752)
-- Name: project_admin_finance project_admin_finance_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_admin_finance
    ADD CONSTRAINT project_admin_finance_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 5456 (class 2606 OID 17684)
-- Name: project_evaluations project_evaluations_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_evaluations
    ADD CONSTRAINT project_evaluations_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 5457 (class 2606 OID 17674)
-- Name: project_evaluations project_evaluations_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_evaluations
    ADD CONSTRAINT project_evaluations_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 5458 (class 2606 OID 17679)
-- Name: project_evaluations project_evaluations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_evaluations
    ADD CONSTRAINT project_evaluations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5410 (class 2606 OID 16857)
-- Name: project_finance project_finance_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_finance
    ADD CONSTRAINT project_finance_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 5411 (class 2606 OID 16890)
-- Name: project_members project_members_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT project_members_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- TOC entry 5412 (class 2606 OID 16880)
-- Name: project_members project_members_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT project_members_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 5413 (class 2606 OID 16885)
-- Name: project_members project_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT project_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5407 (class 2606 OID 16826)
-- Name: project_tasks project_tasks_assignee_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_tasks
    ADD CONSTRAINT project_tasks_assignee_user_id_fkey FOREIGN KEY (assignee_user_id) REFERENCES public.users(id);


--
-- TOC entry 5408 (class 2606 OID 16821)
-- Name: project_tasks project_tasks_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_tasks
    ADD CONSTRAINT project_tasks_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- TOC entry 5409 (class 2606 OID 16816)
-- Name: project_tasks project_tasks_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_tasks
    ADD CONSTRAINT project_tasks_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 5453 (class 2606 OID 17648)
-- Name: project_updates project_updates_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_updates
    ADD CONSTRAINT project_updates_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 5454 (class 2606 OID 17643)
-- Name: project_updates project_updates_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_updates
    ADD CONSTRAINT project_updates_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- TOC entry 5455 (class 2606 OID 17638)
-- Name: project_updates project_updates_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_updates
    ADD CONSTRAINT project_updates_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- TOC entry 5402 (class 2606 OID 17616)
-- Name: projects projects_admin_last_seen_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_admin_last_seen_by_fkey FOREIGN KEY (admin_last_seen_by) REFERENCES public.users(id);


--
-- TOC entry 5403 (class 2606 OID 17611)
-- Name: projects projects_business_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_business_type_id_fkey FOREIGN KEY (business_type_id) REFERENCES public.project_business_types(id);


--
-- TOC entry 5404 (class 2606 OID 16783)
-- Name: projects projects_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 5405 (class 2606 OID 17606)
-- Name: projects projects_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- TOC entry 5406 (class 2606 OID 16788)
-- Name: projects projects_pm_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pm_user_id_fkey FOREIGN KEY (pm_user_id) REFERENCES public.users(id);


--
-- TOC entry 5392 (class 2606 OID 16592)
-- Name: role_permissions role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 5393 (class 2606 OID 16587)
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 5416 (class 2606 OID 16995)
-- Name: stock_movements stock_movements_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 5417 (class 2606 OID 16990)
-- Name: stock_movements stock_movements_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 5418 (class 2606 OID 16985)
-- Name: stock_movements stock_movements_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(id) ON DELETE CASCADE;


--
-- TOC entry 5394 (class 2606 OID 16642)
-- Name: users users_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- TOC entry 5395 (class 2606 OID 16637)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 5433 (class 2606 OID 17228)
-- Name: wage_items wage_items_wage_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wage_items
    ADD CONSTRAINT wage_items_wage_table_id_fkey FOREIGN KEY (wage_table_id) REFERENCES public.wage_tables(id) ON DELETE CASCADE;


--
-- TOC entry 5452 (class 2606 OID 17518)
-- Name: work_sessions work_sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_sessions
    ADD CONSTRAINT work_sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO uplink_app;


--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE attendance_corrections; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.attendance_corrections TO uplink_app;


--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 234
-- Name: SEQUENCE attendance_corrections_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.attendance_corrections_id_seq TO uplink_app;


--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE attendance_records; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.attendance_records TO uplink_app;


--
-- TOC entry 5624 (class 0 OID 0)
-- Dependencies: 232
-- Name: SEQUENCE attendance_records_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.attendance_records_id_seq TO uplink_app;


--
-- TOC entry 5625 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE audit_logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.audit_logs TO uplink_app;


--
-- TOC entry 5627 (class 0 OID 0)
-- Dependencies: 230
-- Name: SEQUENCE audit_logs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.audit_logs_id_seq TO uplink_app;


--
-- TOC entry 5628 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE clients; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.clients TO uplink_app;


--
-- TOC entry 5630 (class 0 OID 0)
-- Dependencies: 228
-- Name: SEQUENCE clients_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.clients_id_seq TO uplink_app;


--
-- TOC entry 5631 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE departments; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.departments TO uplink_app;


--
-- TOC entry 5633 (class 0 OID 0)
-- Dependencies: 224
-- Name: SEQUENCE departments_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.departments_id_seq TO uplink_app;


--
-- TOC entry 5634 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE design_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.design_items TO uplink_app;


--
-- TOC entry 5636 (class 0 OID 0)
-- Dependencies: 260
-- Name: SEQUENCE design_items_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.design_items_id_seq TO uplink_app;


--
-- TOC entry 5637 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE design_packages; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.design_packages TO uplink_app;


--
-- TOC entry 5639 (class 0 OID 0)
-- Dependencies: 258
-- Name: SEQUENCE design_packages_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.design_packages_id_seq TO uplink_app;


--
-- TOC entry 5640 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE estimate_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.estimate_items TO uplink_app;


--
-- TOC entry 5642 (class 0 OID 0)
-- Dependencies: 256
-- Name: SEQUENCE estimate_items_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.estimate_items_id_seq TO uplink_app;


--
-- TOC entry 5643 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE estimate_revisions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.estimate_revisions TO uplink_app;


--
-- TOC entry 5645 (class 0 OID 0)
-- Dependencies: 254
-- Name: SEQUENCE estimate_revisions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.estimate_revisions_id_seq TO uplink_app;


--
-- TOC entry 5646 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE estimate_sections; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.estimate_sections TO uplink_app;


--
-- TOC entry 5647 (class 0 OID 0)
-- Dependencies: 290
-- Name: SEQUENCE estimate_sections_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.estimate_sections_id_seq TO uplink_app;


--
-- TOC entry 5648 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE estimates; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.estimates TO uplink_app;


--
-- TOC entry 5650 (class 0 OID 0)
-- Dependencies: 252
-- Name: SEQUENCE estimates_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.estimates_id_seq TO uplink_app;


--
-- TOC entry 5651 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE inventory; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.inventory TO uplink_app;


--
-- TOC entry 5653 (class 0 OID 0)
-- Dependencies: 248
-- Name: SEQUENCE inventory_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.inventory_id_seq TO uplink_app;


--
-- TOC entry 5654 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE leave_entitlements; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.leave_entitlements TO uplink_app;


--
-- TOC entry 5655 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE maintenance_tickets; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.maintenance_tickets TO uplink_app;


--
-- TOC entry 5657 (class 0 OID 0)
-- Dependencies: 270
-- Name: SEQUENCE maintenance_tickets_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.maintenance_tickets_id_seq TO uplink_app;


--
-- TOC entry 5658 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE material_request_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.material_request_items TO uplink_app;


--
-- TOC entry 5660 (class 0 OID 0)
-- Dependencies: 268
-- Name: SEQUENCE material_request_items_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.material_request_items_id_seq TO uplink_app;


--
-- TOC entry 5661 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE material_requests; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.material_requests TO uplink_app;


--
-- TOC entry 5663 (class 0 OID 0)
-- Dependencies: 266
-- Name: SEQUENCE material_requests_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.material_requests_id_seq TO uplink_app;


--
-- TOC entry 5664 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE performance_reviews; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.performance_reviews TO uplink_app;


--
-- TOC entry 5666 (class 0 OID 0)
-- Dependencies: 277
-- Name: SEQUENCE performance_reviews_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.performance_reviews_id_seq TO uplink_app;


--
-- TOC entry 5667 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.permissions TO uplink_app;


--
-- TOC entry 5669 (class 0 OID 0)
-- Dependencies: 221
-- Name: SEQUENCE permissions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.permissions_id_seq TO uplink_app;


--
-- TOC entry 5670 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE post_tag_map; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.post_tag_map TO uplink_app;


--
-- TOC entry 5671 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE post_tags; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.post_tags TO uplink_app;


--
-- TOC entry 5673 (class 0 OID 0)
-- Dependencies: 274
-- Name: SEQUENCE post_tags_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.post_tags_id_seq TO uplink_app;


--
-- TOC entry 5674 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE posts; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.posts TO uplink_app;


--
-- TOC entry 5676 (class 0 OID 0)
-- Dependencies: 272
-- Name: SEQUENCE posts_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.posts_id_seq TO uplink_app;


--
-- TOC entry 5677 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE products; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.products TO uplink_app;


--
-- TOC entry 5679 (class 0 OID 0)
-- Dependencies: 244
-- Name: SEQUENCE products_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.products_id_seq TO uplink_app;


--
-- TOC entry 5680 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE project_admin_finance; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.project_admin_finance TO uplink_app;


--
-- TOC entry 5681 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE project_business_types; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.project_business_types TO uplink_app;


--
-- TOC entry 5683 (class 0 OID 0)
-- Dependencies: 283
-- Name: SEQUENCE project_business_types_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.project_business_types_id_seq TO uplink_app;


--
-- TOC entry 5684 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE project_evaluations; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.project_evaluations TO uplink_app;


--
-- TOC entry 5686 (class 0 OID 0)
-- Dependencies: 287
-- Name: SEQUENCE project_evaluations_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.project_evaluations_id_seq TO uplink_app;


--
-- TOC entry 5687 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE project_finance; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.project_finance TO uplink_app;


--
-- TOC entry 5689 (class 0 OID 0)
-- Dependencies: 240
-- Name: SEQUENCE project_finance_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.project_finance_id_seq TO uplink_app;


--
-- TOC entry 5690 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE project_members; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.project_members TO uplink_app;


--
-- TOC entry 5692 (class 0 OID 0)
-- Dependencies: 242
-- Name: SEQUENCE project_members_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.project_members_id_seq TO uplink_app;


--
-- TOC entry 5693 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE project_tasks; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.project_tasks TO uplink_app;


--
-- TOC entry 5695 (class 0 OID 0)
-- Dependencies: 238
-- Name: SEQUENCE project_tasks_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.project_tasks_id_seq TO uplink_app;


--
-- TOC entry 5696 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE project_updates; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.project_updates TO uplink_app;


--
-- TOC entry 5698 (class 0 OID 0)
-- Dependencies: 285
-- Name: SEQUENCE project_updates_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.project_updates_id_seq TO uplink_app;


--
-- TOC entry 5699 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE projects; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.projects TO uplink_app;


--
-- TOC entry 5701 (class 0 OID 0)
-- Dependencies: 236
-- Name: SEQUENCE projects_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.projects_id_seq TO uplink_app;


--
-- TOC entry 5702 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE role_permissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.role_permissions TO uplink_app;


--
-- TOC entry 5703 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.roles TO uplink_app;


--
-- TOC entry 5705 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQUENCE roles_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.roles_id_seq TO uplink_app;


--
-- TOC entry 5706 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.settings TO uplink_app;


--
-- TOC entry 5707 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE stock_movements; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.stock_movements TO uplink_app;


--
-- TOC entry 5709 (class 0 OID 0)
-- Dependencies: 250
-- Name: SEQUENCE stock_movements_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.stock_movements_id_seq TO uplink_app;


--
-- TOC entry 5710 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.users TO uplink_app;


--
-- TOC entry 5712 (class 0 OID 0)
-- Dependencies: 226
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_id_seq TO uplink_app;


--
-- TOC entry 5713 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE wage_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.wage_items TO uplink_app;


--
-- TOC entry 5715 (class 0 OID 0)
-- Dependencies: 264
-- Name: SEQUENCE wage_items_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.wage_items_id_seq TO uplink_app;


--
-- TOC entry 5716 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE wage_tables; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.wage_tables TO uplink_app;


--
-- TOC entry 5718 (class 0 OID 0)
-- Dependencies: 262
-- Name: SEQUENCE wage_tables_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.wage_tables_id_seq TO uplink_app;


--
-- TOC entry 5719 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE warehouses; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.warehouses TO uplink_app;


--
-- TOC entry 5721 (class 0 OID 0)
-- Dependencies: 246
-- Name: SEQUENCE warehouses_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.warehouses_id_seq TO uplink_app;


--
-- TOC entry 5722 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE work_sessions; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.work_sessions TO uplink_app;


--
-- TOC entry 5724 (class 0 OID 0)
-- Dependencies: 279
-- Name: SEQUENCE work_sessions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.work_sessions_id_seq TO uplink_app;


--
-- TOC entry 2300 (class 826 OID 17472)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO uplink_app;


--
-- TOC entry 2299 (class 826 OID 17471)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO uplink_app;


-- Completed on 2026-01-30 15:25:53

--
-- PostgreSQL database dump complete
--

\unrestrict ITZSI9UaMIHHCLKMJga7va8x4rh8cybr16KwCkP36nuKXmABt1UVbEAg6jcIVBh

