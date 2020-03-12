--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Debian 11.3-1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-1)

-- Started on 2020-03-12 23:00:13 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- TOC entry 235 (class 1259 OID 41526)
-- Name: articles_article; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.articles_article (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    date date NOT NULL,
    valide boolean NOT NULL,
    moderatorid_id integer,
    redactor_id integer NOT NULL
);


ALTER TABLE public.articles_article OWNER TO django;

--
-- TOC entry 234 (class 1259 OID 41524)
-- Name: articles_article_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.articles_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_article_id_seq OWNER TO django;

--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 234
-- Name: articles_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.articles_article_id_seq OWNED BY public.articles_article.id;


--
-- TOC entry 239 (class 1259 OID 41560)
-- Name: articles_attachmentarticle; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.articles_attachmentarticle (
    id integer NOT NULL,
    attachment_type smallint NOT NULL,
    path character varying(255) NOT NULL,
    articleid_id integer NOT NULL,
    CONSTRAINT articles_attachmentarticle_attachment_type_check CHECK ((attachment_type >= 0))
);


ALTER TABLE public.articles_attachmentarticle OWNER TO django;

--
-- TOC entry 238 (class 1259 OID 41558)
-- Name: articles_attachmentarticle_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.articles_attachmentarticle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_attachmentarticle_id_seq OWNER TO django;

--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 238
-- Name: articles_attachmentarticle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.articles_attachmentarticle_id_seq OWNED BY public.articles_attachmentarticle.id;


--
-- TOC entry 237 (class 1259 OID 41549)
-- Name: articles_commentarticle; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.articles_commentarticle (
    id integer NOT NULL,
    content text NOT NULL,
    date date NOT NULL,
    articleid_id integer,
    mobileuserid_id integer NOT NULL
);


ALTER TABLE public.articles_commentarticle OWNER TO django;

--
-- TOC entry 236 (class 1259 OID 41547)
-- Name: articles_commentarticle_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.articles_commentarticle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_commentarticle_id_seq OWNER TO django;

--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 236
-- Name: articles_commentarticle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.articles_commentarticle_id_seq OWNED BY public.articles_commentarticle.id;


--
-- TOC entry 207 (class 1259 OID 41238)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django;

--
-- TOC entry 206 (class 1259 OID 41236)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django;

--
-- TOC entry 3968 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 209 (class 1259 OID 41248)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django;

--
-- TOC entry 208 (class 1259 OID 41246)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django;

--
-- TOC entry 3969 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 205 (class 1259 OID 41230)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django;

--
-- TOC entry 204 (class 1259 OID 41228)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django;

--
-- TOC entry 3970 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 228 (class 1259 OID 41441)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO django;

--
-- TOC entry 196 (class 1259 OID 40998)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(10) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 41001)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 197
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 227 (class 1259 OID 41419)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO django;

--
-- TOC entry 226 (class 1259 OID 41417)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django;

--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 226
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 203 (class 1259 OID 41220)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django;

--
-- TOC entry 202 (class 1259 OID 41218)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django;

--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 201 (class 1259 OID 41209)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO django;

--
-- TOC entry 200 (class 1259 OID 41207)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO django;

--
-- TOC entry 3976 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 229 (class 1259 OID 41459)
-- Name: django_session; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django;

--
-- TOC entry 233 (class 1259 OID 41494)
-- Name: geo_infectedregions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.geo_infectedregions (
    id integer NOT NULL,
    nb_death integer NOT NULL,
    nb_recovered integer NOT NULL,
    date date NOT NULL,
    valide boolean NOT NULL,
    riskagentid integer,
    riskmoderatorid integer,
    regionid_id integer
);


ALTER TABLE public.geo_infectedregions OWNER TO django;

--
-- TOC entry 232 (class 1259 OID 41492)
-- Name: geo_infectedregions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.geo_infectedregions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_infectedregions_id_seq OWNER TO django;

--
-- TOC entry 3977 (class 0 OID 0)
-- Dependencies: 232
-- Name: geo_infectedregions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.geo_infectedregions_id_seq OWNED BY public.geo_infectedregions.id;


--
-- TOC entry 231 (class 1259 OID 41483)
-- Name: geo_receptioncenter; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.geo_receptioncenter (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    adress character varying(255) NOT NULL,
    regionid_id integer
);


ALTER TABLE public.geo_receptioncenter OWNER TO django;

--
-- TOC entry 230 (class 1259 OID 41481)
-- Name: geo_receptioncenter_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.geo_receptioncenter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geo_receptioncenter_id_seq OWNER TO django;

--
-- TOC entry 3978 (class 0 OID 0)
-- Dependencies: 230
-- Name: geo_receptioncenter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.geo_receptioncenter_id_seq OWNED BY public.geo_receptioncenter.id;


--
-- TOC entry 249 (class 1259 OID 41662)
-- Name: health_healthinfo; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.health_healthinfo (
    id integer NOT NULL,
    weight integer NOT NULL,
    temperature character varying(255) NOT NULL,
    heartbeat character varying(255) NOT NULL,
    date date NOT NULL,
    mobileuserid_id integer NOT NULL
);


ALTER TABLE public.health_healthinfo OWNER TO django;

--
-- TOC entry 248 (class 1259 OID 41660)
-- Name: health_healthinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.health_healthinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.health_healthinfo_id_seq OWNER TO django;

--
-- TOC entry 3979 (class 0 OID 0)
-- Dependencies: 248
-- Name: health_healthinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.health_healthinfo_id_seq OWNED BY public.health_healthinfo.id;


--
-- TOC entry 247 (class 1259 OID 41654)
-- Name: health_photoanalyze; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.health_photoanalyze (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    date date NOT NULL,
    mobileuserid_id integer NOT NULL
);


ALTER TABLE public.health_photoanalyze OWNER TO django;

--
-- TOC entry 246 (class 1259 OID 41652)
-- Name: health_photoanalyze_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.health_photoanalyze_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.health_photoanalyze_id_seq OWNER TO django;

--
-- TOC entry 3980 (class 0 OID 0)
-- Dependencies: 246
-- Name: health_photoanalyze_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.health_photoanalyze_id_seq OWNED BY public.health_photoanalyze.id;


--
-- TOC entry 198 (class 1259 OID 41006)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    region_name character varying(255) NOT NULL,
    code character varying(10) NOT NULL,
    country_id integer NOT NULL,
    latitude numeric(10,8),
    longitude numeric(11,8),
    riskagentid integer,
    riskmoderatorid integer,
    riskvalide boolean DEFAULT false NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 41009)
-- Name: regionsv3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regionsv3_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regionsv3_id_seq OWNER TO postgres;

--
-- TOC entry 3982 (class 0 OID 0)
-- Dependencies: 199
-- Name: regionsv3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regionsv3_id_seq OWNED BY public.regions.id;


--
-- TOC entry 241 (class 1259 OID 41587)
-- Name: reporting_reports; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.reporting_reports (
    id integer NOT NULL,
    attachment_type smallint NOT NULL,
    path character varying(255) NOT NULL,
    valide boolean NOT NULL,
    mobileuserid_id integer NOT NULL,
    moderatorid_id integer,
    CONSTRAINT reporting_reports_attachment_type_check CHECK ((attachment_type >= 0))
);


ALTER TABLE public.reporting_reports OWNER TO django;

--
-- TOC entry 240 (class 1259 OID 41585)
-- Name: reporting_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.reporting_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_reports_id_seq OWNER TO django;

--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 240
-- Name: reporting_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.reporting_reports_id_seq OWNED BY public.reporting_reports.id;


--
-- TOC entry 253 (class 1259 OID 41694)
-- Name: robots_commentrobotscontent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.robots_commentrobotscontent (
    id integer NOT NULL,
    content text NOT NULL,
    date date NOT NULL,
    mobileuserid_id integer NOT NULL,
    robotcontentid_id integer
);


ALTER TABLE public.robots_commentrobotscontent OWNER TO django;

--
-- TOC entry 252 (class 1259 OID 41692)
-- Name: robots_commentrobotscontent_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.robots_commentrobotscontent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robots_commentrobotscontent_id_seq OWNER TO django;

--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 252
-- Name: robots_commentrobotscontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.robots_commentrobotscontent_id_seq OWNED BY public.robots_commentrobotscontent.id;


--
-- TOC entry 251 (class 1259 OID 41685)
-- Name: robots_robotscontent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.robots_robotscontent (
    id integer NOT NULL,
    source_type smallint NOT NULL,
    url character varying(255) NOT NULL,
    date date NOT NULL,
    valide boolean NOT NULL,
    moderatorid_id integer,
    CONSTRAINT robots_robotscontent_source_type_check CHECK ((source_type >= 0))
);


ALTER TABLE public.robots_robotscontent OWNER TO django;

--
-- TOC entry 250 (class 1259 OID 41683)
-- Name: robots_robotscontent_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.robots_robotscontent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robots_robotscontent_id_seq OWNER TO django;

--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 250
-- Name: robots_robotscontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.robots_robotscontent_id_seq OWNED BY public.robots_robotscontent.id;


--
-- TOC entry 225 (class 1259 OID 41354)
-- Name: users_admin; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.users_admin (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_admin OWNER TO django;

--
-- TOC entry 224 (class 1259 OID 41352)
-- Name: users_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_admin_id_seq OWNER TO django;

--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_admin_id_seq OWNED BY public.users_admin.id;


--
-- TOC entry 223 (class 1259 OID 41344)
-- Name: users_agent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.users_agent (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_agent OWNER TO django;

--
-- TOC entry 222 (class 1259 OID 41342)
-- Name: users_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_agent_id_seq OWNER TO django;

--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_agent_id_seq OWNED BY public.users_agent.id;


--
-- TOC entry 221 (class 1259 OID 41334)
-- Name: users_mobileuser; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.users_mobileuser (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_mobileuser OWNER TO django;

--
-- TOC entry 220 (class 1259 OID 41332)
-- Name: users_mobileuser_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_mobileuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_mobileuser_id_seq OWNER TO django;

--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_mobileuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_mobileuser_id_seq OWNED BY public.users_mobileuser.id;


--
-- TOC entry 219 (class 1259 OID 41324)
-- Name: users_moderator; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.users_moderator (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_moderator OWNER TO django;

--
-- TOC entry 218 (class 1259 OID 41322)
-- Name: users_moderator_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_moderator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_moderator_id_seq OWNER TO django;

--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_moderator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_moderator_id_seq OWNED BY public.users_moderator.id;


--
-- TOC entry 217 (class 1259 OID 41314)
-- Name: users_redactor; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.users_redactor (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_redactor OWNER TO django;

--
-- TOC entry 216 (class 1259 OID 41312)
-- Name: users_redactor_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_redactor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_redactor_id_seq OWNER TO django;

--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_redactor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_redactor_id_seq OWNED BY public.users_redactor.id;


--
-- TOC entry 211 (class 1259 OID 41282)
-- Name: users_user; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    user_type smallint NOT NULL,
    CONSTRAINT users_user_user_type_check CHECK ((user_type >= 0))
);


ALTER TABLE public.users_user OWNER TO django;

--
-- TOC entry 213 (class 1259 OID 41298)
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO django;

--
-- TOC entry 212 (class 1259 OID 41296)
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO django;

--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- TOC entry 210 (class 1259 OID 41280)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO django;

--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- TOC entry 215 (class 1259 OID 41306)
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO django;

--
-- TOC entry 214 (class 1259 OID 41304)
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO django;

--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- TOC entry 245 (class 1259 OID 41619)
-- Name: videosHomePage_commentthematicvideo; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public."videosHomePage_commentthematicvideo" (
    id integer NOT NULL,
    content text NOT NULL,
    date date NOT NULL,
    mobileuserid_id integer NOT NULL,
    "thematicVideoid_id" integer
);


ALTER TABLE public."videosHomePage_commentthematicvideo" OWNER TO django;

--
-- TOC entry 244 (class 1259 OID 41617)
-- Name: videosHomePage_commentthematicvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public."videosHomePage_commentthematicvideo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."videosHomePage_commentthematicvideo_id_seq" OWNER TO django;

--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 244
-- Name: videosHomePage_commentthematicvideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public."videosHomePage_commentthematicvideo_id_seq" OWNED BY public."videosHomePage_commentthematicvideo".id;


--
-- TOC entry 243 (class 1259 OID 41608)
-- Name: videosHomePage_thematicvideo; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public."videosHomePage_thematicvideo" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    date date NOT NULL,
    path character varying(255) NOT NULL,
    valide boolean NOT NULL,
    mobileuserid_id integer NOT NULL,
    moderatorid_id integer
);


ALTER TABLE public."videosHomePage_thematicvideo" OWNER TO django;

--
-- TOC entry 242 (class 1259 OID 41606)
-- Name: videosHomePage_thematicvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public."videosHomePage_thematicvideo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."videosHomePage_thematicvideo_id_seq" OWNER TO django;

--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 242
-- Name: videosHomePage_thematicvideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public."videosHomePage_thematicvideo_id_seq" OWNED BY public."videosHomePage_thematicvideo".id;


--
-- TOC entry 3607 (class 2604 OID 41529)
-- Name: articles_article id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_article ALTER COLUMN id SET DEFAULT nextval('public.articles_article_id_seq'::regclass);


--
-- TOC entry 3609 (class 2604 OID 41563)
-- Name: articles_attachmentarticle id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_attachmentarticle ALTER COLUMN id SET DEFAULT nextval('public.articles_attachmentarticle_id_seq'::regclass);


--
-- TOC entry 3608 (class 2604 OID 41552)
-- Name: articles_commentarticle id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_commentarticle ALTER COLUMN id SET DEFAULT nextval('public.articles_commentarticle_id_seq'::regclass);


--
-- TOC entry 3592 (class 2604 OID 41241)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3593 (class 2604 OID 41251)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3591 (class 2604 OID 41233)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3586 (class 2604 OID 41003)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 3603 (class 2604 OID 41422)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3590 (class 2604 OID 41223)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3589 (class 2604 OID 41212)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3606 (class 2604 OID 41497)
-- Name: geo_infectedregions id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.geo_infectedregions ALTER COLUMN id SET DEFAULT nextval('public.geo_infectedregions_id_seq'::regclass);


--
-- TOC entry 3605 (class 2604 OID 41486)
-- Name: geo_receptioncenter id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.geo_receptioncenter ALTER COLUMN id SET DEFAULT nextval('public.geo_receptioncenter_id_seq'::regclass);


--
-- TOC entry 3616 (class 2604 OID 41665)
-- Name: health_healthinfo id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_healthinfo ALTER COLUMN id SET DEFAULT nextval('public.health_healthinfo_id_seq'::regclass);


--
-- TOC entry 3615 (class 2604 OID 41657)
-- Name: health_photoanalyze id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_photoanalyze ALTER COLUMN id SET DEFAULT nextval('public.health_photoanalyze_id_seq'::regclass);


--
-- TOC entry 3587 (class 2604 OID 41011)
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regionsv3_id_seq'::regclass);


--
-- TOC entry 3611 (class 2604 OID 41590)
-- Name: reporting_reports id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.reporting_reports ALTER COLUMN id SET DEFAULT nextval('public.reporting_reports_id_seq'::regclass);


--
-- TOC entry 3619 (class 2604 OID 41697)
-- Name: robots_commentrobotscontent id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.robots_commentrobotscontent ALTER COLUMN id SET DEFAULT nextval('public.robots_commentrobotscontent_id_seq'::regclass);


--
-- TOC entry 3617 (class 2604 OID 41688)
-- Name: robots_robotscontent id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.robots_robotscontent ALTER COLUMN id SET DEFAULT nextval('public.robots_robotscontent_id_seq'::regclass);


--
-- TOC entry 3602 (class 2604 OID 41357)
-- Name: users_admin id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_admin ALTER COLUMN id SET DEFAULT nextval('public.users_admin_id_seq'::regclass);


--
-- TOC entry 3601 (class 2604 OID 41347)
-- Name: users_agent id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_agent ALTER COLUMN id SET DEFAULT nextval('public.users_agent_id_seq'::regclass);


--
-- TOC entry 3600 (class 2604 OID 41337)
-- Name: users_mobileuser id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_mobileuser ALTER COLUMN id SET DEFAULT nextval('public.users_mobileuser_id_seq'::regclass);


--
-- TOC entry 3599 (class 2604 OID 41327)
-- Name: users_moderator id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_moderator ALTER COLUMN id SET DEFAULT nextval('public.users_moderator_id_seq'::regclass);


--
-- TOC entry 3598 (class 2604 OID 41317)
-- Name: users_redactor id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_redactor ALTER COLUMN id SET DEFAULT nextval('public.users_redactor_id_seq'::regclass);


--
-- TOC entry 3594 (class 2604 OID 41285)
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3596 (class 2604 OID 41301)
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- TOC entry 3597 (class 2604 OID 41309)
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3614 (class 2604 OID 41622)
-- Name: videosHomePage_commentthematicvideo id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public."videosHomePage_commentthematicvideo" ALTER COLUMN id SET DEFAULT nextval('public."videosHomePage_commentthematicvideo_id_seq"'::regclass);


--
-- TOC entry 3613 (class 2604 OID 41611)
-- Name: videosHomePage_thematicvideo id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public."videosHomePage_thematicvideo" ALTER COLUMN id SET DEFAULT nextval('public."videosHomePage_thematicvideo_id_seq"'::regclass);


--
-- TOC entry 3941 (class 0 OID 41526)
-- Dependencies: 235
-- Data for Name: articles_article; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.articles_article (id, title, content, date, valide, moderatorid_id, redactor_id) FROM stdin;
\.


--
-- TOC entry 3945 (class 0 OID 41560)
-- Dependencies: 239
-- Data for Name: articles_attachmentarticle; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.articles_attachmentarticle (id, attachment_type, path, articleid_id) FROM stdin;
\.


--
-- TOC entry 3943 (class 0 OID 41549)
-- Dependencies: 237
-- Data for Name: articles_commentarticle; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.articles_commentarticle (id, content, date, articleid_id, mobileuserid_id) FROM stdin;
\.


--
-- TOC entry 3913 (class 0 OID 41238)
-- Dependencies: 207
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3915 (class 0 OID 41248)
-- Dependencies: 209
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3911 (class 0 OID 41230)
-- Dependencies: 205
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add redactor	8	add_redactor
30	Can change redactor	8	change_redactor
31	Can delete redactor	8	delete_redactor
32	Can view redactor	8	view_redactor
33	Can add moderator	9	add_moderator
34	Can change moderator	9	change_moderator
35	Can delete moderator	9	delete_moderator
36	Can view moderator	9	view_moderator
37	Can add mobile user	10	add_mobileuser
38	Can change mobile user	10	change_mobileuser
39	Can delete mobile user	10	delete_mobileuser
40	Can view mobile user	10	view_mobileuser
41	Can add agent	11	add_agent
42	Can change agent	11	change_agent
43	Can delete agent	11	delete_agent
44	Can view agent	11	view_agent
45	Can add admin	12	add_admin
46	Can change admin	12	change_admin
47	Can delete admin	12	delete_admin
48	Can view admin	12	view_admin
49	Can add countries	14	add_countries
50	Can change countries	14	change_countries
51	Can delete countries	14	delete_countries
52	Can view countries	14	view_countries
53	Can add regions	13	add_regions
54	Can change regions	13	change_regions
55	Can delete regions	13	delete_regions
56	Can view regions	13	view_regions
57	Can add reception center	15	add_receptioncenter
58	Can change reception center	15	change_receptioncenter
59	Can delete reception center	15	delete_receptioncenter
60	Can view reception center	15	view_receptioncenter
61	Can add infected regions	16	add_infectedregions
62	Can change infected regions	16	change_infectedregions
63	Can delete infected regions	16	delete_infectedregions
64	Can view infected regions	16	view_infectedregions
65	Can add article	17	add_article
66	Can change article	17	change_article
67	Can delete article	17	delete_article
68	Can view article	17	view_article
69	Can add attachment article	18	add_attachmentarticle
70	Can change attachment article	18	change_attachmentarticle
71	Can delete attachment article	18	delete_attachmentarticle
72	Can view attachment article	18	view_attachmentarticle
73	Can add comment article	19	add_commentarticle
74	Can change comment article	19	change_commentarticle
75	Can delete comment article	19	delete_commentarticle
76	Can view comment article	19	view_commentarticle
77	Can add reports	20	add_reports
78	Can change reports	20	change_reports
79	Can delete reports	20	delete_reports
80	Can view reports	20	view_reports
81	Can add comment thematic video	21	add_commentthematicvideo
82	Can change comment thematic video	21	change_commentthematicvideo
83	Can delete comment thematic video	21	delete_commentthematicvideo
84	Can view comment thematic video	21	view_commentthematicvideo
85	Can add thematic video	22	add_thematicvideo
86	Can change thematic video	22	change_thematicvideo
87	Can delete thematic video	22	delete_thematicvideo
88	Can view thematic video	22	view_thematicvideo
89	Can add health info	23	add_healthinfo
90	Can change health info	23	change_healthinfo
91	Can delete health info	23	delete_healthinfo
92	Can view health info	23	view_healthinfo
93	Can add photo analyze	24	add_photoanalyze
94	Can change photo analyze	24	change_photoanalyze
95	Can delete photo analyze	24	delete_photoanalyze
96	Can view photo analyze	24	view_photoanalyze
97	Can add comment robots content	25	add_commentrobotscontent
98	Can change comment robots content	25	change_commentrobotscontent
99	Can delete comment robots content	25	delete_commentrobotscontent
100	Can view comment robots content	25	view_commentrobotscontent
101	Can add robots content	26	add_robotscontent
102	Can change robots content	26	change_robotscontent
103	Can delete robots content	26	delete_robotscontent
104	Can view robots content	26	view_robotscontent
\.


--
-- TOC entry 3934 (class 0 OID 41441)
-- Dependencies: 228
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- TOC entry 3902 (class 0 OID 40998)
-- Dependencies: 196
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, code) FROM stdin;
1	Andorra	ad
2	United Arab Emirates	ae
3	Afghanistan	af
4	Antigua and Barbuda	ag
5	Anguilla	ai
6	Albania	al
7	Armenia	am
8	Netherlands Antilles	an
9	Angola	ao
10	Argentina	ar
11	Austria	at
12	Australia	au
13	Aruba	aw
14	Azerbaijan	az
15	Bosnia and Herzegovina	ba
16	Barbados	bb
17	Bangladesh	bd
18	Belgium	be
19	Burkina Faso	bf
20	Bulgaria	bg
21	Bahrain	bh
22	Burundi	bi
23	Benin	bj
24	Bermuda	bm
25	Brunei Darussalam	bn
26	Bolivia	bo
27	Brazil	br
28	Bahamas	bs
29	Bhutan	bt
30	Botswana	bw
31	Belarus	by
32	Belize	bz
33	Canada	ca
34	Cocos (Keeling) Islands	cc
35	Democratic Republic of the Congo	cd
36	Central African Republic	cf
37	Congo	cg
38	Switzerland	ch
39	Cote DIvoire (Ivory Coast)	ci
40	Cook Islands	ck
41	Chile	cl
42	Cameroon	cm
43	China	cn
44	Colombia	co
45	Costa Rica	cr
46	Cuba	cu
47	Cape Verde	cv
48	Christmas Island	cx
49	Cyprus	cy
50	Czech Republic	cz
51	Germany	de
52	Djibouti	dj
53	Denmark	dk
54	Dominica	dm
55	Dominican Republic	do
56	Algeria	dz
57	Ecuador	ec
58	Estonia	ee
59	Egypt	eg
60	Western Sahara	eh
61	Eritrea	er
62	Spain	es
63	Ethiopia	et
64	Finland	fi
65	Fiji	fj
66	Falkland Islands (Malvinas)	fk
67	Federated States of Micronesia	fm
68	Faroe Islands	fo
69	France	fr
70	Gabon	ga
71	Great Britain (UK)	gb
72	Grenada	gd
73	Georgia	ge
74	French Guiana	gf
75	NULL	gg
76	Ghana	gh
77	Gibraltar	gi
78	Greenland	gl
79	Gambia	gm
80	Guinea	gn
81	Guadeloupe	gp
82	Equatorial Guinea	gq
83	Greece	gr
84	S. Georgia and S. Sandwich Islands	gs
85	Guatemala	gt
86	Guinea-Bissau	gw
87	Guyana	gy
88	Hong Kong	hk
89	Honduras	hn
90	Croatia (Hrvatska)	hr
91	Haiti	ht
92	Hungary	hu
93	Indonesia	id
94	Ireland	ie
95	Israel	il
96	India	in
97	Iraq	iq
98	Iran	ir
99	Iceland	is
100	Italy	it
101	Jamaica	jm
102	Jordan	jo
103	Japan	jp
104	Kenya	ke
105	Kyrgyzstan	kg
106	Cambodia	kh
107	Kiribati	ki
108	Comoros	km
109	Saint Kitts and Nevis	kn
110	Korea (North)	kp
111	Korea (South)	kr
112	Kuwait	kw
113	Cayman Islands	ky
114	Kazakhstan	kz
115	Laos	la
116	Lebanon	lb
117	Saint Lucia	lc
118	Liechtenstein	li
119	Sri Lanka	lk
120	Liberia	lr
121	Lesotho	ls
122	Lithuania	lt
123	Luxembourg	lu
124	Latvia	lv
125	Libya	ly
126	Morocco	ma
127	Monaco	mc
128	Moldova	md
129	Madagascar	mg
130	Marshall Islands	mh
131	Macedonia	mk
132	Mali	ml
133	Myanmar	mm
134	Mongolia	mn
135	Macao	mo
136	Northern Mariana Islands	mp
137	Martinique	mq
138	Mauritania	mr
139	Montserrat	ms
140	Malta	mt
141	Mauritius	mu
142	Maldives	mv
143	Malawi	mw
144	Mexico	mx
145	Malaysia	my
146	Mozambique	mz
147	Namibia	na
148	New Caledonia	nc
149	Niger	ne
150	Norfolk Island	nf
151	Nigeria	ng
152	Nicaragua	ni
153	Netherlands	nl
154	Norway	no
155	Nepal	np
156	Nauru	nr
157	Niue	nu
158	New Zealand (Aotearoa)	nz
159	Oman	om
160	Panama	pa
161	Peru	pe
162	French Polynesia	pf
163	Papua New Guinea	pg
164	Philippines	ph
165	Pakistan	pk
166	Poland	pl
167	Saint Pierre and Miquelon	pm
168	Pitcairn	pn
169	Palestinian Territory	ps
170	Portugal	pt
171	Palau	pw
172	Paraguay	py
173	Qatar	qa
174	Reunion	re
175	Romania	ro
176	Russian Federation	ru
177	Rwanda	rw
178	Saudi Arabia	sa
179	Solomon Islands	sb
180	Seychelles	sc
181	Sudan	sd
182	Sweden	se
183	Singapore	sg
184	Saint Helena	sh
185	Slovenia	si
186	Svalbard and Jan Mayen	sj
187	Slovakia	sk
188	Sierra Leone	sl
189	San Marino	sm
190	Senegal	sn
191	Somalia	so
192	Suriname	sr
193	Sao Tome and Principe	st
194	El Salvador	sv
195	Syria	sy
196	Swaziland	sz
197	Turks and Caicos Islands	tc
198	Chad	td
199	French Southern Territories	tf
200	Togo	tg
201	Thailand	th
202	Tajikistan	tj
203	Tokelau	tk
204	Turkmenistan	tm
205	Tunisia	tn
206	Tonga	to
207	Turkey	tr
208	Trinidad and Tobago	tt
209	Tuvalu	tv
210	Taiwan	tw
211	Tanzania	tz
212	Ukraine	ua
213	Uganda	ug
214	Uruguay	uy
215	Uzbekistan	uz
216	Saint Vincent and the Grenadines	vc
217	Venezuela	ve
218	Virgin Islands (British)	vg
219	Virgin Islands (U.S.)	vi
220	Viet Nam	vn
221	Vanuatu	vu
222	Wallis and Futuna	wf
223	Samoa	ws
224	Yemen	ye
225	Mayotte	yt
226	South Africa	za
227	Zambia	zm
228	Zaire (former)	zr
229	Zimbabwe	zw
230	United States of America	us
\.


--
-- TOC entry 3933 (class 0 OID 41419)
-- Dependencies: 227
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-03-12 21:18:51.443356+00	ee8483e045adc39f79e5c3a4bbec4c36b884bd75	ee8483e045adc39f79e5c3a4bbec4c36b884bd75	3		6	1
2	2020-03-12 21:19:11.706494+00	2	lotfibouchafa19@gmail.com	3		7	1
3	2020-03-12 21:34:00.454435+00	3	lotfibouchafa19@gmail.com	3		7	1
4	2020-03-12 21:56:19.495592+00	e33c7e6587bd79090e426ee7e5268b90e1a7e5d5	e33c7e6587bd79090e426ee7e5268b90e1a7e5d5	3		6	1
5	2020-03-12 21:56:36.758283+00	4	lotfibouchafa19@gmail.com	3		7	1
\.


--
-- TOC entry 3909 (class 0 OID 41220)
-- Dependencies: 203
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	users	user
8	users	redactor
9	users	moderator
10	users	mobileuser
11	users	agent
12	users	admin
13	geo	regions
14	geo	countries
15	geo	receptioncenter
16	geo	infectedregions
17	articles	article
18	articles	attachmentarticle
19	articles	commentarticle
20	reporting	reports
21	videosHomePage	commentthematicvideo
22	videosHomePage	thematicvideo
23	health	healthinfo
24	health	photoanalyze
25	robots	commentrobotscontent
26	robots	robotscontent
\.


--
-- TOC entry 3907 (class 0 OID 41209)
-- Dependencies: 201
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-03-11 22:05:53.786615+00
2	contenttypes	0002_remove_content_type_name	2020-03-11 22:05:53.839407+00
3	auth	0001_initial	2020-03-11 22:05:54.078715+00
4	auth	0002_alter_permission_name_max_length	2020-03-11 22:05:54.419097+00
5	auth	0003_alter_user_email_max_length	2020-03-11 22:05:54.441132+00
6	auth	0004_alter_user_username_opts	2020-03-11 22:05:54.462011+00
7	auth	0005_alter_user_last_login_null	2020-03-11 22:05:54.474356+00
8	auth	0006_require_contenttypes_0002	2020-03-11 22:05:54.491783+00
9	auth	0007_alter_validators_add_error_messages	2020-03-11 22:05:54.508649+00
10	auth	0008_alter_user_username_max_length	2020-03-11 22:05:54.530588+00
11	auth	0009_alter_user_last_name_max_length	2020-03-11 22:05:54.553801+00
12	auth	0010_alter_group_name_max_length	2020-03-11 22:05:54.576722+00
13	auth	0011_update_proxy_permissions	2020-03-11 22:05:54.599784+00
14	users	0001_initial	2020-03-11 22:05:55.51184+00
15	admin	0001_initial	2020-03-11 22:05:56.129928+00
16	admin	0002_logentry_remove_auto_add	2020-03-11 22:05:56.301794+00
17	admin	0003_logentry_add_action_flag_choices	2020-03-11 22:05:56.330565+00
18	authtoken	0001_initial	2020-03-11 22:05:56.452978+00
19	authtoken	0002_auto_20160226_1747	2020-03-11 22:05:56.559378+00
20	sessions	0001_initial	2020-03-11 22:05:56.653718+00
21	geo	0001_initial	2020-03-12 08:38:12.724193+00
22	geo	0002_auto_20200312_0839	2020-03-12 08:39:45.403935+00
23	geo	0003_auto_20200312_0841	2020-03-12 08:41:49.206389+00
24	geo	0004_infectedregions_receptioncenter	2020-03-12 10:01:14.236208+00
25	articles	0001_initial	2020-03-12 10:11:42.898909+00
26	articles	0002_attachmentarticle_commentarticle	2020-03-12 10:18:39.161739+00
27	reporting	0001_initial	2020-03-12 10:32:22.160306+00
28	videosHomePage	0001_initial	2020-03-12 10:42:27.669686+00
29	health	0001_initial	2020-03-12 10:55:36.242072+00
30	robots	0001_initial	2020-03-12 11:07:29.449223+00
\.


--
-- TOC entry 3935 (class 0 OID 41459)
-- Dependencies: 229
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
4rwg2ep2zqj10apc9mnako0cc4b45lya	OGM4YjQ0ZWVlOTM3NDBlMTUyNWZlNDM4MzNiNjc3YTc0MGYwNzI2Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNTEzMzhmNDZjMzNlN2FhZTJiZGJkOTQwM2YzNDJkOTIxOTMyN2MyIn0=	2020-03-25 22:08:09.638488+00
\.


--
-- TOC entry 3939 (class 0 OID 41494)
-- Dependencies: 233
-- Data for Name: geo_infectedregions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.geo_infectedregions (id, nb_death, nb_recovered, date, valide, riskagentid, riskmoderatorid, regionid_id) FROM stdin;
\.


--
-- TOC entry 3937 (class 0 OID 41483)
-- Dependencies: 231
-- Data for Name: geo_receptioncenter; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.geo_receptioncenter (id, name, adress, regionid_id) FROM stdin;
\.


--
-- TOC entry 3955 (class 0 OID 41662)
-- Dependencies: 249
-- Data for Name: health_healthinfo; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.health_healthinfo (id, weight, temperature, heartbeat, date, mobileuserid_id) FROM stdin;
\.


--
-- TOC entry 3953 (class 0 OID 41654)
-- Dependencies: 247
-- Data for Name: health_photoanalyze; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.health_photoanalyze (id, path, date, mobileuserid_id) FROM stdin;
\.


--
-- TOC entry 3904 (class 0 OID 41006)
-- Dependencies: 198
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, region_name, code, country_id, latitude, longitude, riskagentid, riskmoderatorid, riskvalide) FROM stdin;
2	Andorra la Vella	07	1	42.50000000	1.51666670	\N	\N	f
3	La Massana	04	1	42.56666670	1.51666670	\N	\N	f
4	Ordino	05	1	42.53333330	1.53333330	\N	\N	f
5	Canillo	02	1	42.56666670	1.60000000	\N	\N	f
6	Encamp	03	1	42.53333330	1.56666670	\N	\N	f
7	Escaldes-Engordany	08	1	42.51666670	1.55000000	\N	\N	f
8	Fujairah	04	2	25.43833330	56.19138890	\N	\N	f
9	Abu Dhabi	01	2	24.46666670	54.36666670	\N	\N	f
10	Dubai	03	2	25.27916670	55.32222220	\N	\N	f
11	Ras Al Khaimah	05	2	25.78333330	55.93333330	\N	\N	f
12	Umm Al Quwain	07	2	25.90833330	56.39194440	\N	\N	f
13	Sharjah	06	2	24.96361110	56.32388890	\N	\N	f
14	Ajman	02	2	25.40611110	55.44277780	\N	\N	f
15	Paktika	29	3	33.05194400	68.65000000	\N	\N	f
16	Farah	06	3	32.66972200	62.16000000	\N	\N	f
17	Helmand	10	3	32.24361100	64.68500000	\N	\N	f
18	Kondoz	24	3	36.67472200	69.07861100	\N	\N	f
19	Bamian	05	3	34.23555600	67.19138900	\N	\N	f
20	Ghowr	09	3	33.63472200	64.74027800	\N	\N	f
21	Laghman	35	3	34.74416700	70.28777800	\N	\N	f
23	Ghazni	08	3	33.33305600	67.64305600	\N	\N	f
24	Vardak	27	3	34.24888900	68.60833300	\N	\N	f
25	Oruzgan	39	3	32.81305600	65.96888900	\N	\N	f
26	Zabol	28	3	31.97277800	67.59194400	\N	\N	f
27	Badghis	02	3	34.86972200	63.27388900	\N	\N	f
28	Badakhshan	01	3	38.28888900	70.82861100	\N	\N	f
29	Faryab	07	3	35.57972200	65.10222200	\N	\N	f
30	Takhar	26	3	36.93527800	69.94500000	\N	\N	f
31	Lowgar	17	3	33.89416700	69.23583300	\N	\N	f
32	Herat	11	3	35.43472200	61.37638900	\N	\N	f
33	Daykondi	41	3	33.81888900	65.88000000	\N	\N	f
34	Sar-e Pol	33	3	36.03388900	66.12194400	\N	\N	f
35	Balkh	30	3	36.69777800	68.01861100	\N	\N	f
36	Kabol	13	3	34.71111100	69.31888900	\N	\N	f
37	Nimruz	19	3	31.16472200	62.02666700	\N	\N	f
38	Kandahar	23	3	31.84222200	65.85472200	\N	\N	f
39	Khowst	37	3	33.25277800	69.85888900	\N	\N	f
41	Kapisa	14	3	34.94750000	69.60583300	\N	\N	f
42	Nangarhar	18	3	34.51111100	70.56472200	\N	\N	f
43	Samangan	32	3	35.91666700	68.00027800	\N	\N	f
44	Paktia	36	3	33.75027800	69.79861100	\N	\N	f
45	Baghlan	03	3	35.85861100	69.74694400	\N	\N	f
46	Jowzjan	31	3	37.05972200	66.04333300	\N	\N	f
47	Konar	34	3	34.56833300	70.89277800	\N	\N	f
48	Nurestan	38	3	35.09750000	70.70055600	\N	\N	f
52	Panjshir	42	3	34.52970000	60.84020000	\N	\N	f
53	Saint John	04	4	17.06666670	-61.81666670	\N	\N	f
54	Saint Paul	06	4	17.05000000	-61.80000000	\N	\N	f
55	Saint George	03	4	17.15000000	-61.80000000	\N	\N	f
56	Saint Peter	07	4	17.06666670	-61.73333330	\N	\N	f
57	Saint Mary	05	4	17.03333330	-61.81666670	\N	\N	f
58	Barbuda	01	4	17.63333330	-61.83333330	\N	\N	f
59	Saint Philip	08	4	17.08333330	-61.73333330	\N	\N	f
61	Vlore	51	6	40.11000000	19.76222220	\N	\N	f
62	Korce	46	6	40.70750000	20.39472220	\N	\N	f
63	Shkoder	49	6	42.31250000	19.80777780	\N	\N	f
64	Durres	42	6	41.52833330	19.78805560	\N	\N	f
65	Elbasan	43	6	40.98166670	19.84861110	\N	\N	f
66	Kukes	47	6	42.39444440	20.13916670	\N	\N	f
67	Fier	44	6	40.61472220	19.52444440	\N	\N	f
68	Berat	40	6	40.57500000	20.00027780	\N	\N	f
69	Gjirokaster	45	6	40.07583330	20.13888890	\N	\N	f
70	Tirane	50	6	41.43416670	19.67972220	\N	\N	f
71	Lezhe	48	6	41.78361110	19.64361110	\N	\N	f
72	Diber	41	6	41.61666670	20.05000000	\N	\N	f
73	Aragatsotn	01	7	40.59611110	44.35361110	\N	\N	f
74	Ararat	02	7	40.02361110	44.42444440	\N	\N	f
75	Kotayk	05	7	40.26916670	44.62444440	\N	\N	f
76	Tavush	09	7	40.99027780	45.14527780	\N	\N	f
77	Syunik	08	7	39.23472220	46.43138890	\N	\N	f
78	Gegharkunik	04	7	40.18750000	45.19388890	\N	\N	f
79	Vayots Dzor	10	7	39.73638890	45.34555560	\N	\N	f
80	Lorri	06	7	41.01055560	44.46750000	\N	\N	f
81	Armavir	03	7	40.20000000	44.22750000	\N	\N	f
82	Yerevan	11	7	40.13333330	44.43333330	\N	\N	f
83	Shirak	07	7	40.59000000	43.69833330	\N	\N	f
85	Benguela	01	9	-12.65444440	13.47861110	\N	\N	f
86	Uige	15	9	-6.30000000	15.08333330	\N	\N	f
87	Bengo	19	9	-7.95000000	14.20000000	\N	\N	f
88	Cuanza Norte	05	9	-9.51666670	17.81666670	\N	\N	f
89	Malanje	12	9	-9.41666670	15.48333330	\N	\N	f
90	Cuanza Sul	06	9	-11.11666670	15.13333330	\N	\N	f
91	Huambo	08	9	-12.93333330	15.95000000	\N	\N	f
92	Moxico	14	9	-12.05000000	21.81666670	\N	\N	f
93	Cuando Cubango	04	9	-17.10000000	18.20000000	\N	\N	f
94	Bie	02	9	-11.73333330	17.00000000	\N	\N	f
95	Huila	09	9	-14.73333330	15.03333330	\N	\N	f
96	Lunda Sul	18	9	-10.93333330	19.15000000	\N	\N	f
98	Zaire	16	9	-7.23333330	12.86666670	\N	\N	f
99	Cunene	07	9	-17.13333330	17.30000000	\N	\N	f
100	Lunda Norte	17	9	-8.95000000	19.65000000	\N	\N	f
101	Namibe	13	9	-15.20000000	12.10000000	\N	\N	f
102	Cabinda	03	9	-5.53333330	12.36666670	\N	\N	f
103	Buenos Aires	01	10	-33.78333330	-60.60000000	\N	\N	f
104	Cordoba	05	10	-31.38333330	-64.18333330	\N	\N	f
105	Entre Rios	08	10	-32.26666670	-68.41666670	\N	\N	f
106	Salta	17	10	-25.41666670	-65.53333330	\N	\N	f
107	Jujuy	10	10	-23.76666670	-64.68333330	\N	\N	f
108	La Pampa	11	10	-37.80000000	-67.68333330	\N	\N	f
109	Mendoza	13	10	-34.58333330	-68.55000000	\N	\N	f
110	Misiones	14	10	-27.38333330	-54.76666670	\N	\N	f
111	Santa Cruz	20	10	-51.65000000	-72.30000000	\N	\N	f
112	Santa Fe	21	10	-33.80000000	-61.58333330	\N	\N	f
113	Tucuman	24	10	-26.28333330	-64.48333330	\N	\N	f
114	Corrientes	06	10	-28.83333330	-58.83333330	\N	\N	f
115	San Juan	18	10	-31.65000000	-68.40000000	\N	\N	f
116	Santiago del Estero	22	10	-28.53333330	-64.85000000	\N	\N	f
117	Catamarca	02	10	-28.36666670	-65.16666670	\N	\N	f
118	Neuquen	15	10	-40.33333330	-70.33333330	\N	\N	f
119	Distrito Federal	07	10	-34.60000000	-58.48333330	\N	\N	f
120	La Rioja	12	10	-28.96666670	-66.98333330	\N	\N	f
121	Rio Negro	16	10	-40.85000000	-65.85000000	\N	\N	f
122	Chubut	04	10	-45.55000000	-71.53333330	\N	\N	f
123	San Luis	19	10	-32.58333330	-66.78333330	\N	\N	f
124	Tierra del Fuego	23	10	-54.85000000	-67.51666670	\N	\N	f
125	Formosa	09	10	-25.55000000	-59.85000000	\N	\N	f
126	Chaco	03	10	-26.70000000	-60.73333330	\N	\N	f
127	Niederosterreich	03	11	48.83333330	15.06666670	\N	\N	f
128	Salzburg	05	11	47.55000000	13.35000000	\N	\N	f
129	Oberosterreich	04	11	48.05000000	13.15000000	\N	\N	f
130	Tirol	07	11	46.76388890	12.52000000	\N	\N	f
131	Karnten	02	11	46.55000000	14.50000000	\N	\N	f
132	Steiermark	06	11	46.89444440	15.93194440	\N	\N	f
133	Vorarlberg	08	11	47.51777780	9.86500000	\N	\N	f
134	Wien	09	11	48.16666670	16.48333330	\N	\N	f
135	Burgenland	01	11	47.81666670	17.01666670	\N	\N	f
136	New South Wales	02	12	-33.85000000	151.13333300	\N	\N	f
137	Tasmania	06	12	-41.21666700	146.18333300	\N	\N	f
138	Western Australia	08	12	-26.31666700	118.38333300	\N	\N	f
139	Queensland	04	12	-25.15000000	151.03333300	\N	\N	f
140	Victoria	07	12	-37.68333300	146.36666700	\N	\N	f
141	South Australia	05	12	-34.93333300	138.60000000	\N	\N	f
142	Northern Territory	03	12	-13.25000000	131.10000000	\N	\N	f
143	Australian Capital Territory	01	12	-35.21666700	149.08333300	\N	\N	f
146	Neftcala	36	14	39.31194440	49.20944440	\N	\N	f
147	Xanlar	62	14	40.55805560	46.21722220	\N	\N	f
148	Yevlax	68	14	40.62833330	46.97666670	\N	\N	f
149	Agdas	04	14	40.46944440	47.33416670	\N	\N	f
150	Sabirabad	46	14	39.75000000	49.01666670	\N	\N	f
151	Yardimli	66	14	38.86888890	48.28777780	\N	\N	f
152	Calilabad	15	14	39.27527780	48.36222220	\N	\N	f
153	Saatli	45	14	39.95000000	48.36666670	\N	\N	f
154	Saki	47	14	41.31444440	46.95000000	\N	\N	f
155	Kurdamir	27	14	40.36666670	48.40000000	\N	\N	f
156	Qazax	40	14	41.08250000	45.19333330	\N	\N	f
157	Tovuz	58	14	40.68333330	45.56666670	\N	\N	f
158	Samkir	51	14	40.76777780	46.13611110	\N	\N	f
159	Agdam	03	14	39.86500000	46.92083330	\N	\N	f
160	Qubadli	43	14	39.40916670	46.54583330	\N	\N	f
161	Oguz	37	14	41.07583330	47.59444440	\N	\N	f
162	Lacin	28	14	39.64083330	46.54694440	\N	\N	f
163	Kalbacar	26	14	40.05777780	46.20750000	\N	\N	f
164	Haciqabul	23	14	40.09750000	48.67333330	\N	\N	f
165	Bilasuvar	13	14	39.43333330	48.45000000	\N	\N	f
166	Balakan	10	14	41.72277780	46.23527780	\N	\N	f
167	Naxcivan	35	14	39.13500000	45.63694440	\N	\N	f
168	Qabala	38	14	41.03916670	47.73777780	\N	\N	f
169	Agcabadi	02	14	40.18111110	47.66277780	\N	\N	f
170	Samaxi	50	14	40.52833330	48.74166670	\N	\N	f
171	Davaci	17	14	41.33305560	49.07277780	\N	\N	f
172	Quba	42	14	41.12555560	48.29138890	\N	\N	f
173	Qusar	44	14	41.45500000	48.18888890	\N	\N	f
174	Imisli	24	14	40.08333330	47.88333330	\N	\N	f
175	Abseron	01	14	40.28722220	49.07472220	\N	\N	f
176	Xacmaz	60	14	41.54111110	48.89250000	\N	\N	f
177	Cabrayil	14	14	39.43444440	47.04722220	\N	\N	f
178	Ismayilli	25	14	40.85444440	48.42194440	\N	\N	f
179	Goranboy	21	14	40.71500000	46.62805560	\N	\N	f
180	Fuzuli	18	14	39.43750000	47.33555560	\N	\N	f
181	Baki	09	14	40.37805560	49.96194440	\N	\N	f
182	Beylaqan	12	14	39.71944440	47.83722220	\N	\N	f
183	Daskasan	16	14	40.46944440	46.15166670	\N	\N	f
184	Masalli	32	14	39.09277780	48.66694440	\N	\N	f
185	Zaqatala	70	14	41.57388890	46.77861110	\N	\N	f
186	Lankaran	29	14	38.62472220	48.66305560	\N	\N	f
187	Lerik	31	14	38.67833330	48.55722220	\N	\N	f
188	Ali Bayramli	07	14	39.93194440	48.92027780	\N	\N	f
189	Qax	39	14	41.32694440	46.86805560	\N	\N	f
190	Samux	52	14	40.73916670	46.47111110	\N	\N	f
191	Zardab	71	14	40.19861110	47.68222220	\N	\N	f
192	Gadabay	19	14	40.55416670	45.66666670	\N	\N	f
193	Ucar	59	14	40.49583330	47.50888890	\N	\N	f
194	Barda	11	14	40.34388890	47.12944440	\N	\N	f
195	Siyazan	53	14	40.98333330	48.95000000	\N	\N	f
196	Xocavand	65	14	39.79972220	47.13305560	\N	\N	f
197	Zangilan	69	14	38.93750000	46.59166670	\N	\N	f
198	Xizi	63	14	40.82444440	49.03638890	\N	\N	f
199	Yevlax	67	14	40.78138890	47.20805560	\N	\N	f
200	Agsu	06	14	40.54500000	48.17861110	\N	\N	f
201	Qobustan	41	14	40.42972220	48.96861110	\N	\N	f
202	Goycay	22	14	40.60444440	47.64972220	\N	\N	f
203	Astara	08	14	38.50277780	48.83388890	\N	\N	f
204	Xocali	64	14	39.93666670	46.83277780	\N	\N	f
205	Xankandi	61	14	39.81972220	46.77888890	\N	\N	f
206	Tartar	57	14	40.21250000	46.78888890	\N	\N	f
207	Agstafa	05	14	41.11888890	45.45388890	\N	\N	f
208	Salyan	49	14	39.51916670	48.92000000	\N	\N	f
209	Susa	55	14	39.75027780	46.63138890	\N	\N	f
210	Ganca	20	14	40.65000000	46.31666670	\N	\N	f
211	Sumqayit	54	14	40.57250000	49.70638890	\N	\N	f
212	Saki	48	14	41.09638890	47.21333330	\N	\N	f
213	Naftalan	34	14	40.72305560	46.53666670	\N	\N	f
214	Lankaran	30	14	38.75361110	48.85111110	\N	\N	f
215	Mingacevir	33	14	40.77000000	47.04888890	\N	\N	f
216	Susa	56	14	39.75638890	46.75111110	\N	\N	f
217	Republika Srpska	02	15	44.64333330	18.76777780	\N	\N	f
218	Federation of Bosnia and Herzegovina	01	15	45.02083330	15.82750000	\N	\N	f
220	Saint Joseph	06	16	13.18333330	-59.55000000	\N	\N	f
221	Saint Lucy	07	16	13.28333330	-59.60000000	\N	\N	f
222	Saint Thomas	11	16	13.18333330	-59.56666670	\N	\N	f
223	Saint James	04	16	13.21666670	-59.60000000	\N	\N	f
224	Saint John	05	16	13.16666670	-59.53333330	\N	\N	f
225	Saint Peter	09	16	13.25000000	-59.63333330	\N	\N	f
226	Christ Church	01	16	13.03333330	-59.51666670	\N	\N	f
227	Saint George	03	16	13.13333330	-59.53333330	\N	\N	f
228	Saint Michael	08	16	13.10000000	-59.60000000	\N	\N	f
229	Saint Andrew	02	16	13.21666670	-59.56666670	\N	\N	f
230	Saint Philip	10	16	13.15000000	-59.45000000	\N	\N	f
231	Khulna	82	17	22.28333330	89.16666670	\N	\N	f
232	Rajshahi	83	17	24.83333330	88.88333330	\N	\N	f
233	Dhaka	81	17	23.60000000	89.33333330	\N	\N	f
235	Barisal	85	17	22.91666670	91.00000000	\N	\N	f
236	Sylhet	86	17	24.38333330	91.16666670	\N	\N	f
237	Chittagong	84	17	22.58333330	90.28333330	\N	\N	f
238	Oost-Vlaanderen	08	18	50.88333300	3.93333300	\N	\N	f
239	West-Vlaanderen	09	18	50.78333300	3.21666700	\N	\N	f
241	Limburg	05	18	50.78333300	5.20000000	\N	\N	f
242	Antwerpen	01	18	51.41666700	4.71666700	\N	\N	f
243	Luxembourg	06	18	49.68333300	5.81666700	\N	\N	f
244	Hainaut	03	18	50.63333300	3.78333300	\N	\N	f
245	Liege	04	18	50.46666700	5.35000000	\N	\N	f
246	Namur	07	18	50.26666700	5.23333300	\N	\N	f
247	Brussels Hoofdstedelijk Gewest	11	18	50.83333300	4.30000000	\N	\N	f
248	Vlaams-Brabant	12	18	50.88333300	4.70000000	\N	\N	f
249	Brabant Wallon	10	18	50.71666700	4.61666700	\N	\N	f
251	Mouhoun	63	19	12.50000000	-3.41666670	\N	\N	f
252	Bam	15	19	13.76666670	-1.48333330	\N	\N	f
257	Tapoa	42	19	12.35000000	1.88333330	\N	\N	f
258	Soum	40	19	14.05000000	-0.93333330	\N	\N	f
259	Leraba	61	19	10.63333330	-5.10000000	\N	\N	f
260	Noumbiel	67	19	9.78333330	-3.05000000	\N	\N	f
262	Gnagna	21	19	13.03333330	0.00000000	\N	\N	f
265	Yatenga	76	19	13.98333330	-2.55000000	\N	\N	f
266	Banwa	46	19	12.48333330	-3.98333330	\N	\N	f
267	Poni	69	19	10.06666670	-3.18333330	\N	\N	f
268	Loroum	62	19	13.96666670	-2.25000000	\N	\N	f
269	Kouritenga	28	19	12.32416670	-0.30916670	\N	\N	f
270	Tuy	74	19	11.81666670	-3.68333330	\N	\N	f
271	Kossi	58	19	13.33333330	-3.91666670	\N	\N	f
272	Passore	34	19	12.85000000	-2.05000000	\N	\N	f
273	Kenedougou	54	19	10.91666670	-5.06666670	\N	\N	f
274	Bale	45	19	11.66666670	-3.13333330	\N	\N	f
275	Bougouriba	48	19	10.63333330	-2.98333330	\N	\N	f
276	Houet	51	19	11.28333330	-3.98333330	\N	\N	f
277	Gourma	50	19	12.03333330	0.51666670	\N	\N	f
278	Namentenga	64	19	12.91666670	-0.46666670	\N	\N	f
279	Sanmatenga	70	19	13.15000000	-1.03333330	\N	\N	f
281	Ioba	52	19	11.20000000	-3.16666670	\N	\N	f
282	Ganzourgou	20	19	12.58333330	-0.70000000	\N	\N	f
283	Naouri	65	19	11.11666670	-1.16666670	\N	\N	f
284	Boulkiemde	19	19	12.30000000	-1.80000000	\N	\N	f
285	Zoundweogo	44	19	11.78333330	-1.10000000	\N	\N	f
286	Zondoma	78	19	13.30000000	-2.35000000	\N	\N	f
289	Komoe	55	19	10.55000000	-4.45000000	\N	\N	f
290	Yagha	75	19	13.45000000	0.50000000	\N	\N	f
291	Komondjari	56	19	12.76666670	0.40000000	\N	\N	f
292	Sourou	73	19	13.31666670	-2.90000000	\N	\N	f
293	Nayala	66	19	12.86666670	-2.71666670	\N	\N	f
294	Sissili	72	19	11.18333330	-2.16666670	\N	\N	f
295	Sanguie	36	19	12.36666670	-2.51666670	\N	\N	f
296	Oudalan	33	19	14.56666670	-0.15000000	\N	\N	f
297	Koulpelogo	59	19	11.50000000	-0.01666670	\N	\N	f
298	Ziro	77	19	11.51666670	-1.66666670	\N	\N	f
299	Kourweogo	60	19	12.63333330	-1.86666670	\N	\N	f
300	Oubritenga	68	19	12.60000000	-1.28333330	\N	\N	f
301	Seno	71	19	14.03333330	-0.03333330	\N	\N	f
302	Bazega	47	19	12.06555560	-1.33750000	\N	\N	f
303	Kadiogo	53	19	12.37027780	-1.52472220	\N	\N	f
304	Kompienga	57	19	11.24972220	0.70750000	\N	\N	f
305	Boulgou	49	19	11.78000000	-0.36972220	\N	\N	f
306	Lovech	46	20	42.91666670	26.18333330	\N	\N	f
307	Varna	61	20	42.93333330	27.86666670	\N	\N	f
308	Burgas	39	20	42.75000000	26.70000000	\N	\N	f
309	Razgrad	52	20	43.60000000	26.81666670	\N	\N	f
310	Plovdiv	51	20	42.31666670	24.28333330	\N	\N	f
311	Khaskovo	43	20	41.61666670	25.66666670	\N	\N	f
312	Sofiya	58	20	41.53333330	23.93333330	\N	\N	f
313	Silistra	55	20	43.81666670	27.15000000	\N	\N	f
314	Vidin	63	20	43.88777780	22.52138890	\N	\N	f
315	Montana	47	20	44.01444440	22.80722220	\N	\N	f
316	Mikhaylovgrad	33	20	43.71666670	23.11666670	\N	\N	f
317	Grad Sofiya	42	20	42.80000000	23.33333330	\N	\N	f
318	Turgovishte	60	20	43.15000000	26.16666670	\N	\N	f
319	Kurdzhali	44	20	41.58333330	25.13333330	\N	\N	f
320	Dobrich	40	20	43.81666670	27.75000000	\N	\N	f
321	Shumen	54	20	43.43333330	26.91666670	\N	\N	f
322	Blagoevgrad	38	20	41.73333330	23.15000000	\N	\N	f
323	Smolyan	57	20	41.61666670	25.01666670	\N	\N	f
324	Stara Zagora	59	20	42.60000000	25.20000000	\N	\N	f
325	Pazardzhik	48	20	41.95000000	24.21666670	\N	\N	f
326	Ruse	53	20	43.45000000	25.73333330	\N	\N	f
327	Vratsa	64	20	43.46666670	23.93333330	\N	\N	f
328	Pleven	50	20	43.65000000	25.11666670	\N	\N	f
329	Pernik	49	20	42.47888890	22.74916670	\N	\N	f
330	Kyustendil	45	20	42.15972220	23.01638890	\N	\N	f
331	Yambol	65	20	42.15000000	26.81666670	\N	\N	f
332	Gabrovo	41	20	42.98277780	25.49222220	\N	\N	f
333	Sliven	56	20	42.68333330	25.96666670	\N	\N	f
334	Veliko Turnovo	62	20	42.93333330	25.88333330	\N	\N	f
335	Jidd Hafs	05	21	26.20750000	50.54416670	\N	\N	f
337	Al Mintaqah ash Shamaliyah	10	21	26.21750000	50.50694440	\N	\N	f
339	Al Manamah	02	21	26.21722220	50.54055560	\N	\N	f
340	Sitrah	06	21	26.14305560	50.61027780	\N	\N	f
341	Al Mintaqah al Gharbiyah	08	21	26.16222220	50.44916670	\N	\N	f
342	Mintaqat Juzur Hawar	09	21	26.20777780	50.60250000	\N	\N	f
343	Al Hadd	01	21	26.24555560	50.65416670	\N	\N	f
344	Al Mintaqah al Wusta	11	21	26.18333330	50.55000000	\N	\N	f
345	Ar Rifa	13	21	26.11527780	50.50694440	\N	\N	f
346	Madinat	12	21	26.17361110	50.54777780	\N	\N	f
347	Karuzi	14	22	-3.01694440	30.13666670	\N	\N	f
348	Ruyigi	21	22	-3.53388890	30.17305560	\N	\N	f
349	Bubanza	09	22	-2.98916670	29.41444440	\N	\N	f
350	Bururi	10	22	-3.77500000	29.62611110	\N	\N	f
351	Makamba	17	22	-4.44166670	29.66777780	\N	\N	f
352	Kayanza	15	22	-3.14166670	29.62777780	\N	\N	f
354	Rutana	20	22	-3.68305560	30.21111110	\N	\N	f
355	Muyinga	18	22	-2.82861110	30.35805560	\N	\N	f
356	Cibitoke	12	22	-2.82833330	29.32138890	\N	\N	f
357	Gitega	13	22	-3.67916670	29.90805560	\N	\N	f
358	Cankuzo	11	22	-3.16361110	30.59555560	\N	\N	f
359	Bujumbura	02	22	-3.54916670	29.56138890	\N	\N	f
360	Ngozi	19	22	-2.78750000	29.90138890	\N	\N	f
361	Kirundo	16	22	-2.60000000	30.14027780	\N	\N	f
362	Plateau	17	23	7.11666670	2.63333330	\N	\N	f
363	Collines	11	23	8.05000000	1.66666670	\N	\N	f
366	Oueme	16	23	6.55000000	2.58333330	\N	\N	f
367	Zou	18	23	7.10000000	1.65000000	\N	\N	f
370	Atlanyique	09	23	6.33333330	2.11666670	\N	\N	f
371	Borgou	10	23	9.26666670	2.65000000	\N	\N	f
372	Mono	15	23	6.68333330	1.61666670	\N	\N	f
374	Kouffo	12	23	6.78333330	1.65000000	\N	\N	f
375	Donga	13	23	9.68333330	1.75000000	\N	\N	f
376	Littoral	14	23	6.61666670	2.45000000	\N	\N	f
377	Alibori	07	23	11.16666670	2.98333330	\N	\N	f
378	Atakora	08	23	10.23333330	1.38333330	\N	\N	f
379	Devonshire	01	24	32.28333330	-64.75000000	\N	\N	f
380	Paget	04	24	32.29416670	-64.76055560	\N	\N	f
381	Saint Georges	07	24	32.37027780	-64.65444440	\N	\N	f
382	Smiths	09	24	32.32111110	-64.73694440	\N	\N	f
383	Hamilton	03	24	32.29416670	-64.78388890	\N	\N	f
384	Warwick	11	24	32.26944440	-64.80888890	\N	\N	f
385	Sandys	08	24	32.27111110	-64.88000000	\N	\N	f
386	Saint George	06	24	32.38166670	-64.67805560	\N	\N	f
387	Hamilton	02	24	32.32638890	-64.74111110	\N	\N	f
389	Santa Cruz	08	26	-19.75000000	-58.25000000	\N	\N	f
390	Pando	06	26	-10.93333330	-67.15000000	\N	\N	f
391	Tarija	09	26	-21.53333330	-63.55000000	\N	\N	f
392	La Paz	04	26	-17.48333330	-69.43333330	\N	\N	f
393	Oruro	05	26	-18.88333330	-66.61666670	\N	\N	f
394	Cochabamba	02	26	-17.76666670	-66.50000000	\N	\N	f
395	Potosi	07	26	-20.55000000	-65.63333330	\N	\N	f
396	Chuquisaca	01	26	-19.23333330	-65.21666670	\N	\N	f
397	El Beni	03	26	-12.58333330	-65.56666670	\N	\N	f
398	Santa Catarina	26	27	-27.03333300	-50.93333300	\N	\N	f
399	Mato Grosso do Sul	11	27	-22.53333300	-54.35000000	\N	\N	f
400	Rio Grande do Sul	23	27	-28.75000000	-53.10000000	\N	\N	f
401	Espirito Santo	08	27	-19.76666700	-40.60000000	\N	\N	f
402	Bahia	05	27	-12.06666700	-38.96666700	\N	\N	f
403	Rondonia	24	27	-8.85000000	-62.28333300	\N	\N	f
404	Minas Gerais	15	27	-22.03222200	-43.48944400	\N	\N	f
405	Paraiba	17	27	-6.71666700	-37.98333300	\N	\N	f
406	Amapa	03	27	0.31666700	-50.88333300	\N	\N	f
407	Amazonas	04	27	-3.94638900	-62.90388900	\N	\N	f
408	Para	16	27	-1.11666700	-49.65000000	\N	\N	f
409	Ceara	06	27	-5.91666700	-39.51666700	\N	\N	f
410	Rio de Janeiro	21	27	-21.73333300	-41.23333300	\N	\N	f
411	Goias	29	27	-16.10000000	-48.80000000	\N	\N	f
412	Sao Paulo	27	27	-24.03333300	-48.05000000	\N	\N	f
413	Parana	18	27	-24.95000000	-49.81666700	\N	\N	f
414	Rio Grande do Norte	22	27	-5.94805600	-36.06194400	\N	\N	f
415	Acre	01	27	-10.71666700	-70.45000000	\N	\N	f
416	Piaui	20	27	-10.70416700	-45.05583300	\N	\N	f
417	Pernambuco	30	27	-7.86666700	-38.23333300	\N	\N	f
418	Mato Grosso	14	27	-15.73333300	-55.66666700	\N	\N	f
419	Maranhao	13	27	-3.35027800	-42.41972200	\N	\N	f
420	Tocantins	31	27	-9.56555600	-49.05638900	\N	\N	f
421	Roraima	25	27	0.65000000	-61.55000000	\N	\N	f
422	Alagoas	02	27	-9.63333300	-36.95000000	\N	\N	f
423	Sergipe	28	27	-10.78333300	-36.96666700	\N	\N	f
424	Distrito Federal	07	27	-15.61666700	-47.66666700	\N	\N	f
425	Acklins and Crooked Islands	24	28	22.36666670	-73.95000000	\N	\N	f
426	Mayaguana	16	28	22.36666670	-72.96666670	\N	\N	f
427	Long Island	15	28	23.60000000	-75.30000000	\N	\N	f
428	New Providence	23	28	25.00000000	-77.51666670	\N	\N	f
429	Exuma	10	28	23.65000000	-76.01666670	\N	\N	f
430	Bimini	05	28	25.71666670	-79.30000000	\N	\N	f
431	Governors Harbour	27	28	25.33333330	-76.43333330	\N	\N	f
432	San Salvador and Rum Cay	35	28	23.95000000	-74.51666670	\N	\N	f
433	Fresh Creek	26	28	24.70000000	-77.76666670	\N	\N	f
434	Cat Island	06	28	24.63333330	-75.70000000	\N	\N	f
435	Nichollstown and Berry Islands	32	28	25.03333330	-77.98333330	\N	\N	f
436	Kemps Bay	30	28	24.45000000	-77.71666670	\N	\N	f
437	Freeport	25	28	26.51666670	-78.78333330	\N	\N	f
438	Rock Sound	33	28	24.63333330	-76.16666670	\N	\N	f
439	Harbour Island	22	28	25.38333330	-76.80000000	\N	\N	f
440	High Rock	29	28	26.60000000	-78.31666670	\N	\N	f
441	Green Turtle Cay	28	28	26.80000000	-77.43333330	\N	\N	f
442	Marsh Harbour	31	28	26.28333330	-77.03333330	\N	\N	f
443	Ragged Island	18	28	22.19083330	-75.72583330	\N	\N	f
444	Sandy Point	34	28	26.31666670	-77.56666670	\N	\N	f
445	Inagua	13	28	20.95000000	-73.66666670	\N	\N	f
446	Wangdi Phodrang	22	29	27.35000000	89.96666670	\N	\N	f
447	Paro	13	29	27.48333330	89.40000000	\N	\N	f
448	Daga	08	29	26.98333330	89.81666670	\N	\N	f
449	Mongar	12	29	27.21666670	91.50000000	\N	\N	f
450	Shemgang	18	29	27.21666670	90.71666670	\N	\N	f
451	Thimphu	20	29	27.70000000	89.55000000	\N	\N	f
452	Tashigang	19	29	27.31666670	91.56666670	\N	\N	f
453	Chirang	07	29	27.03333330	90.23333330	\N	\N	f
454	Geylegphug	09	29	27.26666670	90.30000000	\N	\N	f
455	Samdrup	17	29	26.81666670	91.71666670	\N	\N	f
456	Bumthang	05	29	27.55000000	90.71666670	\N	\N	f
457	Samchi	16	29	26.90000000	89.10000000	\N	\N	f
458	Tongsa	21	29	27.40000000	90.46666670	\N	\N	f
459	Chhukha	06	29	27.20000000	89.55000000	\N	\N	f
460	Pemagatsel	14	29	27.05000000	91.41666670	\N	\N	f
461	Ha	10	29	27.41666670	89.35000000	\N	\N	f
462	Punakha	15	29	27.66666670	89.91666670	\N	\N	f
463	Lhuntshi	11	29	27.95000000	91.03333330	\N	\N	f
464	Central	01	30	-22.55000000	27.53333330	\N	\N	f
465	South-East	09	30	-24.67805560	25.91694440	\N	\N	f
466	North-East	08	30	-21.96666670	28.33333330	\N	\N	f
467	North-West	11	30	-21.01666670	24.33333330	\N	\N	f
468	Ghanzi	03	30	-23.01666670	21.81666670	\N	\N	f
469	Kweneng	06	30	-23.61666670	25.91666670	\N	\N	f
470	Kgalagadi	04	30	-26.65000000	21.91666670	\N	\N	f
472	Southern	10	30	-23.98333330	23.90000000	\N	\N	f
473	Kgatleng	05	30	-23.31666670	25.80000000	\N	\N	f
474	Homyelskaya Voblasts	02	31	51.98333330	30.85000000	\N	\N	f
475	Minsk	04	31	54.12055560	30.97500000	\N	\N	f
476	Brestskaya Voblasts	01	31	52.21666670	24.00000000	\N	\N	f
477	Hrodzyenskaya Voblasts	03	31	54.61666670	26.61666670	\N	\N	f
478	Mahilyowskaya Voblasts	06	31	54.85000000	26.63333330	\N	\N	f
479	Vitsyebskaya Voblasts	07	31	55.58333330	27.11666670	\N	\N	f
480	Toledo	06	32	16.16222220	-89.09388890	\N	\N	f
481	Cayo	02	32	16.70500000	-89.04888890	\N	\N	f
482	Stann Creek	05	32	16.66666670	-88.51666670	\N	\N	f
483	Corozal	03	32	18.33333330	-88.43333330	\N	\N	f
484	Orange Walk	04	32	17.71666670	-89.01666670	\N	\N	f
485	Belize	01	32	18.15000000	-87.83333330	\N	\N	f
500	Equateur	02	35	0.76666700	20.71666700	\N	\N	f
501	Orientale	09	35	3.86666700	30.23333300	\N	\N	f
503	Nord-Kivu	11	35	-1.13333300	27.15000000	\N	\N	f
505	Maniema	10	35	-4.35000000	27.18333300	\N	\N	f
506	Bandundu	01	35	-2.86666700	16.85000000	\N	\N	f
508	Katanga	05	35	-5.93333300	29.20000000	\N	\N	f
509	Sud-Kivu	12	35	-4.57722200	28.78472200	\N	\N	f
510	Bas-Congo	08	35	-5.85000000	13.43333300	\N	\N	f
511	Kasai-Oriental	04	35	-4.71666700	24.66666700	\N	\N	f
512	Kinshasa	06	35	-2.83333300	16.20000000	\N	\N	f
513	Nana-Mambere	09	36	5.33333330	15.18333330	\N	\N	f
514	Ouaka	11	36	6.23333330	20.76666670	\N	\N	f
515	Haute-Kotto	03	36	6.53333330	22.01666670	\N	\N	f
516	Sangha-Mbaere	16	36	3.38333330	15.76666670	\N	\N	f
517	Bamingui-Bangoran	01	36	8.51666670	20.50000000	\N	\N	f
518	Mbomou	08	36	5.63333330	23.16666670	\N	\N	f
519	Basse-Kotto	02	36	4.53333330	21.38333330	\N	\N	f
520	Kemo	06	36	5.98333330	19.15000000	\N	\N	f
521	Haut-Mbomou	05	36	5.35000000	27.20000000	\N	\N	f
522	Ouham-Pende	13	36	5.21666670	16.73333330	\N	\N	f
523	Ouham	12	36	6.65000000	18.13333330	\N	\N	f
524	Ombella-Mpoko	17	36	4.31888890	18.54111110	\N	\N	f
525	Cuvette-Ouest	14	36	10.23333330	22.83333330	\N	\N	f
526	Mambere-Kadei	04	36	4.75000000	15.16666670	\N	\N	f
527	Lobaye	07	36	4.96666670	17.45000000	\N	\N	f
529	Nana-Grebizi	15	36	6.66666670	18.36666670	\N	\N	f
530	Bangui	18	36	4.36666670	18.58333330	\N	\N	f
532	Plateaux	08	37	-1.24361110	15.26222220	\N	\N	f
533	Pool	11	37	-3.36000000	15.47583330	\N	\N	f
534	Sangha	10	37	2.14305560	13.54055560	\N	\N	f
535	Lekoumou	05	37	-2.58138890	13.59194440	\N	\N	f
536	Likouala	06	37	3.31666670	16.96666670	\N	\N	f
537	Kouilou	04	37	-4.51666670	12.60000000	\N	\N	f
538	Niari	07	37	-4.28333330	12.63333330	\N	\N	f
539	Bouenza	01	37	-4.26500000	13.54527780	\N	\N	f
540	Brazzaville	12	37	-4.25916670	15.28472220	\N	\N	f
541	Cuvette-Ouest	14	37	-0.87250000	14.82055560	\N	\N	f
542	Cuvette	13	37	-0.48694440	15.90805560	\N	\N	f
543	Thurgau	19	38	47.48333300	8.90000000	\N	\N	f
544	Aargau	01	38	47.38333300	8.05000000	\N	\N	f
545	Bern	05	38	47.05000000	7.28333300	\N	\N	f
546	Zurich	25	38	47.33333300	8.76666700	\N	\N	f
547	Fribourg	06	38	46.56666700	7.30000000	\N	\N	f
548	Ausser-Rhoden	02	38	47.41666700	9.31666700	\N	\N	f
549	Valais	22	38	46.23333300	7.86666700	\N	\N	f
550	Uri	21	38	46.63333300	8.83333300	\N	\N	f
551	Graubunden	09	38	46.70000000	9.63333300	\N	\N	f
552	Ticino	20	38	46.53333300	8.83333300	\N	\N	f
553	Luzern	11	38	47.06666700	8.36666700	\N	\N	f
554	Obwalden	14	38	46.83333300	8.18333300	\N	\N	f
555	Solothurn	18	38	47.30000000	7.60000000	\N	\N	f
556	Basel-Stadt	04	38	47.46666700	7.60000000	\N	\N	f
557	Inner-Rhoden	10	38	47.28333300	9.41666700	\N	\N	f
558	Zug	24	38	47.13333300	8.58333300	\N	\N	f
559	Vaud	23	38	46.71666700	6.51666700	\N	\N	f
560	Jura	26	38	47.43333300	7.13333300	\N	\N	f
561	Basel-Landschaft	03	38	47.55000000	7.53333300	\N	\N	f
562	Schwyz	17	38	47.08333300	8.71666700	\N	\N	f
563	Sankt Gallen	15	38	47.48333300	9.55000000	\N	\N	f
564	Schaffhausen	16	38	47.60000000	8.65000000	\N	\N	f
565	Glarus	08	38	47.13333300	9.13333300	\N	\N	f
566	Geneve	07	38	46.28333300	6.21666700	\N	\N	f
567	Neuchatel	12	38	46.96666700	6.86666700	\N	\N	f
568	Nidwalden	13	38	46.96666700	8.46666700	\N	\N	f
579	Vallee du Bandama	90	39	7.20861100	-5.32888900	\N	\N	f
581	Nzi-Comoe	86	39	7.67944400	-4.06305600	\N	\N	f
585	Moyen-Comoe	85	39	6.72972200	-3.49638900	\N	\N	f
587	Lagunes	82	39	5.34111100	-4.02805600	\N	\N	f
588	Zanzan	92	39	8.11666700	-2.76666700	\N	\N	f
589	Sud-Comoe	89	39	5.46750000	-3.21444400	\N	\N	f
590	Lacs	81	39	6.60000000	-5.00000000	\N	\N	f
598	Fromager	79	39	6.15000000	-5.95000000	\N	\N	f
600	Agneby	74	39	5.93416700	-4.22138900	\N	\N	f
601	Bas-Sassandra	76	39	4.70000000	-6.96666700	\N	\N	f
603	Marahoue	83	39	7.00750000	-5.55527800	\N	\N	f
608	Bafing	75	39	8.35000000	-7.83333300	\N	\N	f
614	Savanes	87	39	9.46666700	-5.56666700	\N	\N	f
619	Sud-Bandama	88	39	5.83972200	-5.36000000	\N	\N	f
620	Haut-Sassandra	80	39	7.36666700	-6.46666700	\N	\N	f
621	Moyen-Cavally	84	39	6.54027800	-7.48583300	\N	\N	f
622	Dix-Huit Montagnes	78	39	7.40527800	-7.54750000	\N	\N	f
623	Denguele	77	39	9.51000000	-7.56916700	\N	\N	f
624	Worodougou	91	39	7.96111100	-6.67305600	\N	\N	f
626	Bio-Bio	06	41	-37.33333330	-71.51666670	\N	\N	f
627	Maule	11	41	-35.25000000	-71.85000000	\N	\N	f
628	Los Lagos	09	41	-41.40000000	-72.93333330	\N	\N	f
629	Tarapaca	13	41	-18.01666670	-69.21666670	\N	\N	f
630	Valparaiso	01	41	-33.00000000	-71.51666670	\N	\N	f
631	Atacama	05	41	-28.83333330	-70.73333330	\N	\N	f
632	Coquimbo	07	41	-30.83333330	-70.70000000	\N	\N	f
633	Libertador General Bernardo OHiggins	08	41	-34.65000000	-70.85000000	\N	\N	f
634	Antofagasta	03	41	-25.13333330	-69.56666670	\N	\N	f
635	Araucania	04	41	-38.93333330	-73.21666670	\N	\N	f
636	Aisen del General Carlos Ibanez del Campo	02	41	-45.40000000	-72.70000000	\N	\N	f
637	Region Metropolitana	12	41	-33.50000000	-70.18333330	\N	\N	f
638	Magallanes y de la Antartica Chilena	10	41	-51.00000000	-72.80000000	\N	\N	f
639	Est	04	42	5.60000000	14.05000000	\N	\N	f
640	Adamaoua	10	42	6.41666670	12.73333330	\N	\N	f
641	Centre	11	42	4.13333330	12.43333330	\N	\N	f
642	Sud	14	42	2.98333330	11.65000000	\N	\N	f
643	Nord-Ouest	07	42	6.93333330	10.55000000	\N	\N	f
644	Extreme-Nord	12	42	12.10000000	14.70000000	\N	\N	f
645	Sud-Ouest	09	42	5.38333330	8.93333330	\N	\N	f
646	Littoral	05	42	3.65000000	9.81666670	\N	\N	f
647	Nord	13	42	9.28333330	14.01666670	\N	\N	f
648	Ouest	08	42	5.73333330	9.95000000	\N	\N	f
649	Sichuan	32	43	32.91666670	101.70000000	\N	\N	f
650	Xinjiang	13	43	40.58444440	80.40416670	\N	\N	f
651	Nei Mongol	20	43	43.96666670	116.03333330	\N	\N	f
652	Yunnan	29	43	26.80000000	101.23333330	\N	\N	f
653	Guizhou	18	43	26.39166670	105.35833330	\N	\N	f
654	Heilongjiang	08	43	45.53333330	126.98333330	\N	\N	f
655	Shandong	25	43	36.15583330	116.02972220	\N	\N	f
656	Liaoning	19	43	42.05888890	121.74500000	\N	\N	f
657	Shaanxi	26	43	35.17444440	109.31305560	\N	\N	f
658	Qinghai	06	43	32.83333330	95.16666670	\N	\N	f
659	Gansu	15	43	35.90805560	103.84500000	\N	\N	f
660	Jiangsu	04	43	34.43333330	118.61666670	\N	\N	f
661	Fujian	07	43	24.65833330	117.03972220	\N	\N	f
662	Hunan	11	43	28.32750000	109.59250000	\N	\N	f
663	Jiangxi	03	43	29.10000000	115.76666670	\N	\N	f
664	Guangxi	16	43	24.56666670	107.41666670	\N	\N	f
665	Zhejiang	02	43	28.88555560	120.99305560	\N	\N	f
666	Hebei	10	43	39.36277780	114.57305560	\N	\N	f
667	Hubei	12	43	30.62694440	111.33916670	\N	\N	f
668	Anhui	01	43	30.30833330	116.05000000	\N	\N	f
669	Tianjin	28	43	39.40000000	117.40000000	\N	\N	f
670	Hainan	31	43	18.53583330	109.28361110	\N	\N	f
671	Guangdong	30	43	23.23000000	114.63305560	\N	\N	f
672	Xizang	14	43	30.66666670	94.26666670	\N	\N	f
673	Jilin	05	43	44.83333330	124.03333330	\N	\N	f
674	Chongqing	33	43	29.51666670	107.21666670	\N	\N	f
675	Beijing	22	43	39.98916670	115.94972220	\N	\N	f
676	Shanxi	24	43	38.28000000	112.30916670	\N	\N	f
677	Shanghai	23	43	31.07111110	121.01888890	\N	\N	f
678	Henan	09	43	32.60500000	113.16611110	\N	\N	f
679	Ningxia	21	43	37.93611110	107.22694440	\N	\N	f
680	Cundinamarca	33	44	4.56666670	-74.10000000	\N	\N	f
681	Norte de Santander	21	44	8.04055560	-72.62250000	\N	\N	f
682	Narino	20	44	1.10000000	-77.46666670	\N	\N	f
684	Risaralda	24	44	5.15750000	-75.90944440	\N	\N	f
685	Antioquia	02	44	5.79333330	-75.43083330	\N	\N	f
686	Amazonas	01	44	-1.38333330	-72.20000000	\N	\N	f
687	La Guajira	17	44	11.30944440	-72.89583330	\N	\N	f
688	Choco	11	44	5.00000000	-77.16666670	\N	\N	f
689	Cauca	09	44	2.36666670	-76.71666670	\N	\N	f
690	Valle del Cauca	29	44	4.22527780	-75.95250000	\N	\N	f
691	Arauca	03	44	6.87527780	-70.57972220	\N	\N	f
692	Meta	19	44	3.98750000	-73.75666670	\N	\N	f
693	Caqueta	08	44	1.60611110	-75.64000000	\N	\N	f
694	Casanare	32	44	4.93055560	-72.38250000	\N	\N	f
695	Vaupes	30	44	0.70000000	-70.23333330	\N	\N	f
696	Tolima	28	44	3.91750000	-75.18000000	\N	\N	f
697	Huila	16	44	1.81916670	-75.89638890	\N	\N	f
699	Atlantico	04	44	10.70000000	-74.85000000	\N	\N	f
700	Cordoba	12	44	8.56138890	-75.54527780	\N	\N	f
701	Santander	26	44	6.66666670	-74.26666670	\N	\N	f
702	Cesar	10	44	10.18333330	-73.90000000	\N	\N	f
703	Sucre	27	44	9.43333330	-75.00000000	\N	\N	f
705	Putumayo	22	44	-0.03333330	-75.20000000	\N	\N	f
707	Guaviare	14	44	2.57972220	-72.58805560	\N	\N	f
708	San Andres y Providencia	25	44	13.35000000	-81.38333330	\N	\N	f
709	Vichada	31	44	5.13333330	-70.80000000	\N	\N	f
710	Quindio	23	44	4.46666670	-75.71666670	\N	\N	f
711	Guainia	15	44	3.82166670	-67.95277780	\N	\N	f
712	Distrito Especial	34	44	4.68333330	-74.10000000	\N	\N	f
713	Guanacaste	03	45	10.25000000	-85.71666670	\N	\N	f
714	Limon	06	45	10.16666670	-83.51666670	\N	\N	f
715	Puntarenas	07	45	10.15000000	-85.05000000	\N	\N	f
716	Alajuela	01	45	10.33333330	-84.46666670	\N	\N	f
717	Heredia	04	45	10.56666670	-84.00000000	\N	\N	f
718	San Jose	08	45	9.81666670	-84.18333330	\N	\N	f
719	Cartago	02	45	9.90000000	-83.83333330	\N	\N	f
720	Cienfuegos	08	46	22.21666670	-80.26666670	\N	\N	f
721	La Habana	11	46	22.96666670	-82.65000000	\N	\N	f
722	Santiago de Cuba	15	46	20.16166670	-75.49000000	\N	\N	f
723	Camaguey	05	46	21.43333330	-77.01666670	\N	\N	f
724	Ciudad de la Habana	02	46	23.01694440	-82.40138890	\N	\N	f
725	Villa Clara	16	46	22.60000000	-79.85000000	\N	\N	f
726	Pinar del Rio	01	46	22.66666670	-83.48333330	\N	\N	f
727	Matanzas	03	46	22.53333330	-80.98333330	\N	\N	f
728	Guantanamo	10	46	20.38333330	-75.33333330	\N	\N	f
729	Las Tunas	13	46	20.95000000	-77.13333330	\N	\N	f
730	Ciego de Avila	07	46	21.78500000	-78.27666670	\N	\N	f
731	Sancti Spiritus	14	46	21.99138890	-78.97861110	\N	\N	f
732	Holguin	12	46	20.63333330	-75.23333330	\N	\N	f
733	Granma	09	46	20.08333330	-77.25000000	\N	\N	f
734	Isla de la Juventud	04	46	21.68333330	-82.66666670	\N	\N	f
735	Sao Domingos	17	47	15.05000000	-23.48333330	\N	\N	f
738	Limassol	05	49	34.79166670	32.97916670	\N	\N	f
739	Nicosia	04	49	35.22916670	33.51666670	\N	\N	f
740	Paphos	06	49	34.74166670	32.48750000	\N	\N	f
741	Famagusta	01	49	35.10000000	33.86250000	\N	\N	f
742	Larnaca	03	49	34.97916670	33.62083330	\N	\N	f
743	Kyrenia	02	49	35.28750000	33.26666670	\N	\N	f
744	Karlovarsky kraj	81	50	49.98333330	12.75000000	\N	\N	f
745	Pardubicky kraj	86	50	49.83333330	16.50000000	\N	\N	f
747	Jihomoravsky kraj	78	50	49.31666670	16.66666670	\N	\N	f
748	Jihocesky kraj	79	50	49.00000000	14.55000000	\N	\N	f
749	Olomoucky kraj	84	50	50.20000000	17.01666670	\N	\N	f
750	Moravskoslezsky kraj	85	50	50.13333330	17.45000000	\N	\N	f
752	Kralovehradecky kraj	82	50	50.13333330	16.23333330	\N	\N	f
753	Ustecky kraj	89	50	50.73333330	13.90000000	\N	\N	f
754	Stredocesky kraj	88	50	50.11666670	13.38333330	\N	\N	f
755	Vysocina	80	50	49.65000000	15.10000000	\N	\N	f
756	Plzensky kraj	87	50	49.78333330	12.56666670	\N	\N	f
760	Zlinsky kraj	90	50	49.16666670	17.46666670	\N	\N	f
761	Hlavni mesto Praha	52	50	50.10000000	14.55000000	\N	\N	f
763	Liberecky kraj	83	50	50.88333330	14.48333330	\N	\N	f
773	Nordrhein-Westfalen	07	51	52.08333300	7.38333300	\N	\N	f
774	Baden-Wurttemberg	01	51	47.85000000	8.85000000	\N	\N	f
775	Bayern	02	51	47.51666700	9.96666700	\N	\N	f
776	Rheinland-Pfalz	08	51	49.78333300	6.60000000	\N	\N	f
777	Niedersachsen	06	51	52.48333300	7.03333300	\N	\N	f
778	Schleswig-Holstein	10	51	54.06666700	9.43333300	\N	\N	f
779	Brandenburg	11	51	52.90000000	11.90000000	\N	\N	f
780	Sachsen-Anhalt	14	51	52.75000000	10.91666700	\N	\N	f
781	Sachsen	13	51	51.13333300	13.26666700	\N	\N	f
782	Thuringen	15	51	50.90000000	10.06666700	\N	\N	f
783	Hessen	05	51	51.20000000	9.93333300	\N	\N	f
784	Mecklenburg-Vorpommern	12	51	54.18333300	13.01666700	\N	\N	f
785	Hamburg	04	51	53.41666700	10.23333300	\N	\N	f
786	Berlin	16	51	52.45000000	13.53333300	\N	\N	f
787	Saarland	09	51	49.23333300	7.23333300	\N	\N	f
788	Bremen	03	51	53.06666700	8.81666700	\N	\N	f
789	Ali Sabieh	01	52	11.13333330	42.88583330	\N	\N	f
790	Tadjoura	05	52	11.77027780	42.65194440	\N	\N	f
792	Obock	04	52	12.42166670	42.89555560	\N	\N	f
794	Arta	08	52	11.52222220	42.84194440	\N	\N	f
795	Dikhil	06	52	11.10861110	42.37388890	\N	\N	f
796	Syddanmark	21	53	55.21666700	9.98333300	\N	\N	f
797	Midtjylland	18	53	56.11666700	10.05000000	\N	\N	f
798	Nordjylland	19	53	57.16666700	9.75000000	\N	\N	f
799	Sjelland	20	53	55.21666700	11.76666700	\N	\N	f
800	Hovedstaden	17	53	55.71666700	12.33333300	\N	\N	f
801	Saint Andrew	02	54	15.60000000	-61.38333330	\N	\N	f
802	Saint David	03	54	15.51666670	-61.26666670	\N	\N	f
803	Saint Joseph	06	54	15.43333330	-61.45000000	\N	\N	f
804	Saint George	04	54	15.26666670	-61.35000000	\N	\N	f
805	Saint Patrick	09	54	15.28333330	-61.25000000	\N	\N	f
806	Saint Peter	11	54	15.50000000	-61.46666670	\N	\N	f
807	Saint John	05	54	15.58333330	-61.41666670	\N	\N	f
808	Saint Mark	08	54	15.20000000	-61.38333330	\N	\N	f
809	Saint Paul	10	54	15.33333330	-61.36666670	\N	\N	f
810	Saint Luke	07	54	15.25000000	-61.38333330	\N	\N	f
811	Sanchez Ramirez	21	55	19.01666670	-69.93333330	\N	\N	f
812	Espaillat	08	55	19.41666670	-70.50000000	\N	\N	f
813	Duarte	06	55	19.18333330	-69.93333330	\N	\N	f
814	Samana	20	55	19.31666670	-69.50000000	\N	\N	f
815	Maria Trinidad Sanchez	14	55	19.66666670	-69.95000000	\N	\N	f
816	La Romana	12	55	18.13333330	-68.71666670	\N	\N	f
817	Azua	01	55	18.35000000	-70.51666670	\N	\N	f
818	San Cristobal	33	55	18.36666670	-70.10833330	\N	\N	f
819	El Seibo	28	55	18.66666670	-69.01666670	\N	\N	f
820	Monte Plata	32	55	18.75000000	-69.71666670	\N	\N	f
821	Distrito Nacional	05	55	18.60000000	-69.81666670	\N	\N	f
822	Elias Pina	11	55	18.81666670	-71.66666670	\N	\N	f
823	Santiago	25	55	19.23333330	-70.70000000	\N	\N	f
824	Santiago Rodriguez	26	55	19.48333330	-71.41666670	\N	\N	f
825	Peravia	17	55	18.23333330	-70.33333330	\N	\N	f
826	Monte Cristi	15	55	19.75000000	-71.25000000	\N	\N	f
827	Salcedo	19	55	19.36666670	-70.38333330	\N	\N	f
828	Puerto Plata	18	55	19.76666670	-71.00000000	\N	\N	f
829	San Pedro De Macoris	24	55	18.41666670	-69.50000000	\N	\N	f
830	Pedernales	16	55	18.15000000	-71.70000000	\N	\N	f
831	Independencia	09	55	18.63333330	-71.58333330	\N	\N	f
832	La Vega	30	55	19.15000000	-70.51666670	\N	\N	f
833	Dajabon	04	55	19.51666670	-71.63333330	\N	\N	f
834	Hato Mayor	29	55	18.68333330	-69.25000000	\N	\N	f
835	Barahona	03	55	18.28333330	-71.16666670	\N	\N	f
836	San Juan	23	55	18.86611110	-71.59583330	\N	\N	f
837	La Altagracia	10	55	18.75000000	-68.58333330	\N	\N	f
838	Valverde	27	55	19.55000000	-71.00000000	\N	\N	f
839	Baoruco	02	55	18.43333330	-71.23333330	\N	\N	f
840	Monsenor Nouel	31	55	18.93333330	-70.48333330	\N	\N	f
841	Ain Temouchent	36	56	35.30500000	-1.18000000	\N	\N	f
842	Oran	09	56	35.77944440	-0.12916670	\N	\N	f
843	Medea	06	56	36.32222220	2.88611110	\N	\N	f
844	Chlef	41	56	36.25777780	1.61250000	\N	\N	f
845	Bechar	38	56	31.01666670	-2.73333330	\N	\N	f
846	Tamanghasset	53	56	22.88833330	4.84222220	\N	\N	f
847	Bejaia	18	56	36.53333330	5.05000000	\N	\N	f
848	Tizi Ouzou	14	56	36.86666670	4.40000000	\N	\N	f
849	Boumerdes	40	56	36.85583330	3.85666670	\N	\N	f
850	Ain Defla	35	56	36.15000000	2.20000000	\N	\N	f
851	Annaba	37	56	36.88416670	7.53000000	\N	\N	f
852	Setif	12	56	36.16666670	5.23333330	\N	\N	f
853	Relizane	51	56	35.66500000	0.80305560	\N	\N	f
854	Mascara	26	56	35.46833330	0.49527780	\N	\N	f
855	Mostaganem	07	56	36.10444440	0.27861110	\N	\N	f
856	Tiaret	13	56	35.28333330	1.45000000	\N	\N	f
857	Bordj Bou Arreridj	39	56	35.83500000	5.06833330	\N	\N	f
858	Tipaza	55	56	36.41500000	1.71888890	\N	\N	f
860	Bouira	21	56	36.33888890	3.80611110	\N	\N	f
861	Tissemsilt	56	56	35.70000000	1.56666670	\N	\N	f
862	Jijel	24	56	36.65000000	5.66666670	\N	\N	f
863	Saida	10	56	35.03472220	0.12000000	\N	\N	f
864	Illizi	46	56	24.53055560	9.47833330	\N	\N	f
865	Tlemcen	15	56	35.05000000	-2.18333330	\N	\N	f
866	Adrar	34	56	27.90000000	-0.28333330	\N	\N	f
867	Laghouat	25	56	34.10888890	2.10194440	\N	\N	f
868	Constantine	04	56	36.80000000	6.00000000	\N	\N	f
869	Khenchela	47	56	34.95000000	6.83333330	\N	\N	f
870	Batna	03	56	35.35000000	6.41666670	\N	\N	f
871	Alger	01	56	36.76666670	3.05000000	\N	\N	f
872	Msila	27	56	35.91222220	3.67166670	\N	\N	f
873	Skikda	31	56	36.97027780	6.52777780	\N	\N	f
874	Oum el Bouaghi	29	56	35.94194440	7.18750000	\N	\N	f
875	Naama	49	56	33.28333330	-0.76666670	\N	\N	f
876	Sidi Bel Abbes	30	56	35.10500000	-0.83250000	\N	\N	f
877	Mila	48	56	36.42444440	6.47250000	\N	\N	f
878	Ouargla	50	56	31.93861110	5.39500000	\N	\N	f
879	Djelfa	22	56	35.22611110	2.45166670	\N	\N	f
880	El Bayadh	42	56	33.40416670	0.73972220	\N	\N	f
881	Souk Ahras	52	56	36.12777780	8.00333330	\N	\N	f
882	El Oued	43	56	33.30000000	6.90000000	\N	\N	f
883	Blida	20	56	36.68333330	3.46666670	\N	\N	f
884	Biskra	19	56	35.14416670	5.83416670	\N	\N	f
885	Tebessa	33	56	35.40000000	8.06666670	\N	\N	f
886	Guelma	23	56	36.47222220	7.73333330	\N	\N	f
887	Tindouf	54	56	29.36666670	-7.73333330	\N	\N	f
888	Ghardaia	45	56	19.56027780	5.77250000	\N	\N	f
889	Manabi	14	57	-1.26666670	-80.38333330	\N	\N	f
890	Zamora-Chinchipe	20	57	-3.63277780	-78.92444440	\N	\N	f
891	Morona-Santiago	15	57	-2.11666670	-78.16666670	\N	\N	f
892	El Oro	08	57	-3.33333330	-79.50000000	\N	\N	f
893	Azuay	02	57	-3.26666670	-79.26666670	\N	\N	f
894	Sucumbios	22	57	0.09277780	-76.89888890	\N	\N	f
895	Guayas	10	57	-2.21666670	-79.87500000	\N	\N	f
896	Los Rios	13	57	-1.21666670	-79.51666670	\N	\N	f
897	Loja	12	57	-4.40000000	-79.80000000	\N	\N	f
898	Chimborazo	06	57	-2.26666670	-78.73333330	\N	\N	f
899	Tungurahua	19	57	-1.13333330	-78.46666670	\N	\N	f
900	Esmeraldas	09	57	1.07500000	-79.28333330	\N	\N	f
901	Pichincha	18	57	-0.08333330	-78.36666670	\N	\N	f
902	Imbabura	11	57	0.28333330	-78.21666670	\N	\N	f
903	Cotopaxi	07	57	-1.08333330	-78.71666670	\N	\N	f
904	Carchi	05	57	0.88333330	-78.08333330	\N	\N	f
905	Napo	23	57	-1.06666670	-77.51666670	\N	\N	f
906	Canar	04	57	-2.70000000	-78.80000000	\N	\N	f
907	Pastaza	17	57	-1.63333330	-77.98333330	\N	\N	f
908	Orellana	24	57	-0.70000000	-76.00000000	\N	\N	f
909	Bolivar	03	57	-1.65000000	-79.03333330	\N	\N	f
910	Galapagos	01	57	-0.75000000	-90.31666670	\N	\N	f
911	Harjumaa	01	58	59.56416670	25.53555560	\N	\N	f
912	Tartumaa	18	58	58.25027780	26.88083330	\N	\N	f
913	Hiiumaa	02	58	58.79833330	22.66388890	\N	\N	f
914	Raplamaa	13	58	58.82083330	24.91638890	\N	\N	f
915	Valgamaa	19	58	58.10138890	26.19444440	\N	\N	f
916	Laanemaa	07	58	58.93055560	23.71166670	\N	\N	f
917	Polvamaa	12	58	58.06555560	26.96722220	\N	\N	f
918	Parnumaa	11	58	58.68722220	24.50833330	\N	\N	f
919	Laane-Virumaa	08	58	59.41694440	26.11722220	\N	\N	f
920	Jarvamaa	04	58	58.89444440	25.41777780	\N	\N	f
921	Viljandimaa	20	58	58.12527780	25.34972220	\N	\N	f
922	Saaremaa	14	58	58.42972220	22.14638890	\N	\N	f
923	Jogevamaa	05	58	58.70611110	25.89916670	\N	\N	f
924	Ida-Virumaa	03	58	58.93194440	26.82166670	\N	\N	f
925	Vorumaa	21	58	57.72166670	26.51083330	\N	\N	f
926	Ash Sharqiyah	14	59	30.30000000	31.75000000	\N	\N	f
927	Al Gharbiyah	05	59	30.98583330	31.00361110	\N	\N	f
928	Ad Daqahliyah	01	59	31.26805560	31.45416670	\N	\N	f
929	Al Jizah	08	59	29.81666670	31.05000000	\N	\N	f
930	Al Minya	10	59	28.58750000	30.76750000	\N	\N	f
931	Kafr ash Shaykh	21	59	31.07305560	30.88750000	\N	\N	f
932	Al Buhayrah	03	59	31.03916670	30.36083330	\N	\N	f
933	Qina	23	59	25.90000000	32.78333330	\N	\N	f
934	Al Qahirah	11	59	30.06666670	31.28333330	\N	\N	f
935	Al Iskandariyah	06	59	31.03805560	29.82694440	\N	\N	f
936	Al Fayyum	04	59	29.28638890	30.81277780	\N	\N	f
937	Asyut	17	59	27.26666670	31.15027780	\N	\N	f
938	Al Minufiyah	09	59	30.47083330	31.08694440	\N	\N	f
939	Bani Suwayf	18	59	28.85305560	30.58750000	\N	\N	f
940	Al Qalyubiyah	12	59	30.15611110	31.18722220	\N	\N	f
941	Aswan	16	59	24.20000000	32.88333330	\N	\N	f
942	Shamal Sina	27	59	30.83333330	34.11666670	\N	\N	f
943	Suhaj	24	59	26.60000000	31.56666670	\N	\N	f
944	Janub Sina	26	59	28.47361110	33.33083330	\N	\N	f
945	Al Bahr al Ahmar	02	59	24.45000000	35.20000000	\N	\N	f
946	Al Ismailiyah	07	59	30.53527780	31.82611110	\N	\N	f
947	Dumyat	20	59	31.30694440	31.75416670	\N	\N	f
948	Matruh	22	59	30.81666670	29.16666670	\N	\N	f
949	As Suways	15	59	29.88333330	32.46666670	\N	\N	f
950	Al Wadi al Jadid	13	59	27.06666670	27.96666670	\N	\N	f
951	Bur Said	19	59	31.23944440	32.27833330	\N	\N	f
954	Aragon	52	62	40.55000000	-0.80000000	\N	\N	f
955	Galicia	58	62	43.58333300	-8.00000000	\N	\N	f
956	Castilla y Leon	55	62	42.71666700	-5.51666700	\N	\N	f
957	Extremadura	57	62	40.25000000	-5.96666700	\N	\N	f
958	Pais Vasco	59	62	43.15000000	-2.60000000	\N	\N	f
959	Cantabria	39	62	43.31666700	-3.85000000	\N	\N	f
960	Navarra	32	62	42.65000000	-2.18333300	\N	\N	f
961	Asturias	34	62	43.38333300	-5.61666700	\N	\N	f
962	La Rioja	27	62	42.56666700	-2.70000000	\N	\N	f
963	Castilla-La Mancha	54	62	40.90000000	-2.48333300	\N	\N	f
964	Murcia	31	62	38.20000000	-1.05000000	\N	\N	f
965	Andalucia	51	62	36.73333300	-3.01666700	\N	\N	f
966	Comunidad Valenciana	60	62	38.70000000	-0.25000000	\N	\N	f
967	Catalonia	56	62	42.31666700	2.31666700	\N	\N	f
968	Canarias	53	62	28.01666700	-16.58333300	\N	\N	f
969	Madrid	29	62	40.53333300	-3.48333300	\N	\N	f
970	Islas Baleares	07	62	39.70000000	2.78333300	\N	\N	f
984	Oulu	08	64	64.73333300	26.30000000	\N	\N	f
985	Western Finland	15	64	60.38333300	22.65000000	\N	\N	f
986	Lapland	06	64	68.90000000	27.01666700	\N	\N	f
987	Eastern Finland	14	64	62.00000000	27.20000000	\N	\N	f
988	Southern Finland	13	64	60.31666700	25.86666700	\N	\N	f
989	Aland	01	64	60.08472200	20.25722200	\N	\N	f
992	Northern	03	65	-16.41666670	179.21666670	\N	\N	f
993	Western	05	65	-17.66666670	177.53333330	\N	\N	f
994	Central	01	65	-19.18333330	179.75000000	\N	\N	f
995	Eastern	02	65	-19.03333330	178.35000000	\N	\N	f
997	Yap	04	67	9.54444440	138.10500000	\N	\N	f
998	Pohnpei	02	67	6.81944440	158.30111110	\N	\N	f
999	Chuuk	03	67	7.35000000	151.83333330	\N	\N	f
1000	Kosrae	01	67	5.32944440	162.94444440	\N	\N	f
1002	Aquitaine	97	69	42.98333300	-0.40000000	\N	\N	f
1003	Nord-Pas-de-Calais	B4	69	50.23333300	3.21666700	\N	\N	f
1004	Lorraine	B2	69	48.53333300	5.50000000	\N	\N	f
1005	Haute-Normandie	A7	69	49.58333300	1.63333300	\N	\N	f
1006	Picardie	B6	69	49.70000000	1.76666700	\N	\N	f
1007	Franche-Comte	A6	69	47.13333300	5.88333300	\N	\N	f
1008	Pays de la Loire	B5	69	47.55000000	-1.53333300	\N	\N	f
1009	Champagne-Ardenne	A4	69	48.56666700	3.93333300	\N	\N	f
1010	Centre	A3	69	48.35000000	2.16666700	\N	\N	f
1011	Languedoc-Roussillon	A9	69	43.45000000	3.30000000	\N	\N	f
1012	Poitou-Charentes	B7	69	46.33333300	0.93333300	\N	\N	f
1013	Rhone-Alpes	B9	69	45.50000000	5.98333300	\N	\N	f
1014	Basse-Normandie	99	69	49.40000000	0.30000000	\N	\N	f
1015	Ile-de-France	A8	69	48.71666700	2.41666700	\N	\N	f
1016	Bourgogne	A1	69	47.03333300	3.75000000	\N	\N	f
1017	Auvergne	98	69	44.83333300	3.66666700	\N	\N	f
1018	Provence-Alpes-Cote dAzur	B8	69	44.78333300	6.93333300	\N	\N	f
1019	Corse	A5	69	42.01666700	9.30000000	\N	\N	f
1020	Alsace	C1	69	48.58333300	7.63333300	\N	\N	f
1021	Bretagne	A2	69	48.13333300	-1.53333300	\N	\N	f
1022	Midi-Pyrenees	B3	69	42.96666700	-0.08333300	\N	\N	f
1023	Limousin	B1	69	45.51666700	1.75000000	\N	\N	f
1024	Estuaire	01	70	0.56666670	9.36666670	\N	\N	f
1025	Woleu-Ntem	09	70	1.11666670	11.71666670	\N	\N	f
1026	Moyen-Ogooue	03	70	-0.26666670	10.50000000	\N	\N	f
1027	Ogooue-Maritime	08	70	-0.91666670	9.45000000	\N	\N	f
1028	Ogooue-Lolo	07	70	-1.10000000	13.11666670	\N	\N	f
1029	Ogooue-Ivindo	06	70	0.33333330	12.00000000	\N	\N	f
1030	Haut-Ogooue	02	70	-0.78333330	13.93333330	\N	\N	f
1031	Ngounie	04	70	-1.00000000	11.45000000	\N	\N	f
1032	Nyanga	05	70	-3.45000000	10.66666670	\N	\N	f
1033	Worcestershire	Q4	71	52.30000000	-2.36666700	\N	\N	f
1034	Hampshire	F2	71	51.83333300	0.91666700	\N	\N	f
1035	Herefordshire	F7	71	52.18333300	-2.01666700	\N	\N	f
1036	Essex	E4	71	51.78333300	0.26666700	\N	\N	f
1037	Powys	Y8	71	52.33333300	-3.40000000	\N	\N	f
1038	Monmouthshire	Y4	71	51.96666700	-2.90000000	\N	\N	f
1039	Scottish Borders	T9	71	55.85000000	-2.38333300	\N	\N	f
1040	Cumbria	C9	71	54.83333300	-3.28333300	\N	\N	f
1041	Devon	D4	71	50.90000000	-4.28333300	\N	\N	f
1042	Staffordshire	M9	71	52.80000000	-1.86666700	\N	\N	f
1043	Dorset	D6	71	50.66666700	-2.60000000	\N	\N	f
1044	Hertford	F8	71	51.70000000	-0.41666700	\N	\N	f
1045	Cambridgeshire	C3	71	52.18333300	-0.20000000	\N	\N	f
1046	Lancashire	H2	71	52.38333300	-0.18333300	\N	\N	f
1047	Conwy	X8	71	53.23333300	-4.01666700	\N	\N	f
1048	Ceredigion	X6	71	52.25000000	-4.25000000	\N	\N	f
1049	Rhondda Cynon Taff	Y9	71	51.69888900	-3.42694400	\N	\N	f
1050	Highland	V3	71	57.30000000	-4.26666700	\N	\N	f
1051	Perth and Kinross	W1	71	56.31666700	-3.35000000	\N	\N	f
1052	Caerphilly	X4	71	51.69250000	-3.22500000	\N	\N	f
1053	Blaenau Gwent	X2	71	51.71194400	-3.14166700	\N	\N	f
1054	Merthyr Tydfil	Y3	71	51.72361100	-3.36611100	\N	\N	f
1055	Pembrokeshire	Y7	71	51.95944400	-5.12583300	\N	\N	f
1056	Aberdeenshire	T6	71	57.55000000	-2.61666700	\N	\N	f
1057	Gwynedd	Y2	71	52.75000000	-3.70000000	\N	\N	f
1058	Aberdeen City	T5	71	57.13333300	-2.10000000	\N	\N	f
1059	Fife	V1	71	56.05000000	-3.30000000	\N	\N	f
1060	Neath Port Talbot	Y5	71	51.66666700	-3.78333300	\N	\N	f
1061	Isle of Anglesey	X1	71	53.18333300	-4.45000000	\N	\N	f
1062	Wokingham	Q2	71	51.40000000	-0.91666700	\N	\N	f
1063	York	Q5	71	53.81666700	-1.33333300	\N	\N	f
1064	Stirling	W6	71	56.18333300	-4.38333300	\N	\N	f
1065	Carmarthenshire	X7	71	51.98305600	-4.06027800	\N	\N	f
1066	Bridgend	X3	71	51.54000000	-3.59555600	\N	\N	f
1067	East Lothian	U6	71	56.00000000	-2.85000000	\N	\N	f
1068	Angus	T7	71	56.68333300	-2.76666700	\N	\N	f
1069	Moray	V6	71	57.46666700	-3.23333300	\N	\N	f
1070	Torfaen	Z2	71	51.73277800	-3.06638900	\N	\N	f
1071	Swansea	Z1	71	51.63333300	-3.96666700	\N	\N	f
1072	Vale of Glamorgan	Z3	71	51.39111100	-3.39250000	\N	\N	f
1073	Oxfordshire	K2	71	51.66666700	-1.28333300	\N	\N	f
1074	Surrey	N7	71	51.18333300	-0.40000000	\N	\N	f
1075	South Lanarkshire	W5	71	55.48333300	-3.70000000	\N	\N	f
1076	Leicestershire	H5	71	52.78333300	-0.91666700	\N	\N	f
1077	Wigan	P7	71	53.51666700	-2.58333300	\N	\N	f
1078	Northamptonshire	J1	71	52.10000000	-1.05000000	\N	\N	f
1079	Lincolnshire	H7	71	53.26666700	0.11666700	\N	\N	f
1080	Argyll and Bute	T8	71	56.60000000	-6.60000000	\N	\N	f
1081	Northumberland	J6	71	55.30000000	-1.63333300	\N	\N	f
1082	Norfolk	I9	71	52.63333300	1.55000000	\N	\N	f
1083	Solihull	M2	71	52.45000000	-1.81666700	\N	\N	f
1084	Wrexham	Z4	71	52.96666700	-3.08333300	\N	\N	f
1085	Cheshire	C5	71	53.26666700	-2.60000000	\N	\N	f
1086	Shropshire	L6	71	52.45000000	-3.01666700	\N	\N	f
1087	Banbridge	R2	71	54.30000000	-6.36666700	\N	\N	f
1088	South Gloucestershire	M6	71	51.52444400	-2.27833300	\N	\N	f
1089	West Lothian	W9	71	55.83333300	-3.60000000	\N	\N	f
1091	Kent	G5	71	51.28333300	0.40000000	\N	\N	f
1092	Leeds	H3	71	53.85000000	-1.56666700	\N	\N	f
1093	Somerset	M3	71	52.71666700	-2.55000000	\N	\N	f
1094	Gloucestershire	E6	71	52.10000000	-1.70000000	\N	\N	f
1095	Buckinghamshire	B9	71	51.95000000	-0.91666700	\N	\N	f
1096	Coleraine	R6	71	55.01666700	-6.66666700	\N	\N	f
1097	Craigavon	R8	71	54.50000000	-6.30000000	\N	\N	f
1098	Antrim	Q6	71	54.51666700	-6.26666700	\N	\N	f
1099	Limavady	S4	71	55.10000000	-6.93333300	\N	\N	f
1100	Armagh	Q8	71	54.35000000	-6.48333300	\N	\N	f
1101	Ballymena	Q9	71	54.86666700	-6.36666700	\N	\N	f
1102	North Yorkshire	J7	71	54.31666700	-1.48333300	\N	\N	f
1103	Sefton	L8	71	53.60000000	-3.03333300	\N	\N	f
1104	Warwickshire	P3	71	54.80000000	-2.73333300	\N	\N	f
1105	Derry	S6	71	55.23333300	-6.50000000	\N	\N	f
1106	Eilean Siar	W8	71	58.23333300	-6.33333300	\N	\N	f
1107	North Lanarkshire	V8	71	55.85000000	-3.98333300	\N	\N	f
1108	Falkirk	U9	71	56.06666700	-3.76666700	\N	\N	f
1109	Shetland Islands	W3	71	60.26666700	-1.38333300	\N	\N	f
1110	Wiltshire	P8	71	52.71666700	-2.95000000	\N	\N	f
1111	Durham	D8	71	52.63333300	-2.26666700	\N	\N	f
1112	Darlington	D1	71	54.48333300	-1.68333300	\N	\N	f
1113	Suffolk	N5	71	52.15000000	1.60000000	\N	\N	f
1114	Derbyshire	D3	71	53.06666700	-1.53333300	\N	\N	f
1115	Walsall	O8	71	52.60000000	-1.91666700	\N	\N	f
1116	Rotherham	L3	71	53.43333300	-1.31666700	\N	\N	f
1117	West Dunbartonshire	W7	71	55.98333300	-4.60000000	\N	\N	f
1118	East Sussex	E2	71	50.80000000	0.15000000	\N	\N	f
1119	Coventry	C7	71	52.41666700	-1.55000000	\N	\N	f
1120	Derby	D2	71	52.93333300	-1.48333300	\N	\N	f
1121	Southend-on-Sea	M5	71	51.46666700	0.65000000	\N	\N	f
1122	Clackmannanshire	U1	71	56.11666700	-3.80000000	\N	\N	f
1123	Kirklees	G8	71	53.61666700	-1.75000000	\N	\N	f
1124	St. Helens	N1	71	53.08333300	-1.76666700	\N	\N	f
1125	Omagh	T3	71	54.68333300	-7.73333300	\N	\N	f
1126	Cornwall	C6	71	50.60000000	-4.53333300	\N	\N	f
1127	North Lincolnshire	J3	71	53.58333300	-0.73333300	\N	\N	f
1128	Newry and Mourne	S9	71	54.16666700	-6.63333300	\N	\N	f
1129	South Ayrshire	W4	71	55.20000000	-4.70000000	\N	\N	f
1130	Isle of Wight	G2	71	50.66666700	-1.18333300	\N	\N	f
1132	Dumfries and Galloway	U2	71	55.11666700	-3.56666700	\N	\N	f
1133	Bedfordshire	A5	71	52.03333300	-0.48333300	\N	\N	f
1134	Down	R9	71	54.35000000	-5.75000000	\N	\N	f
1135	Dungannon	S1	71	54.45000000	-6.60000000	\N	\N	f
1136	Renfrewshire	W2	71	55.88333300	-4.31666700	\N	\N	f
1137	Leicester	H4	71	52.65000000	-1.18333300	\N	\N	f
1138	Glasgow City	V2	71	55.86666700	-4.21666700	\N	\N	f
1139	West Sussex	P6	71	50.81666700	-0.80000000	\N	\N	f
1140	Warrington	P2	71	53.35000000	-2.55000000	\N	\N	f
1141	Cookstown	R7	71	54.63333300	-6.55000000	\N	\N	f
1142	North Ayrshire	V7	71	55.63333300	-4.75000000	\N	\N	f
1143	Barnsley	A3	71	53.53333300	-1.41666700	\N	\N	f
1144	Strabane	T4	71	54.73333300	-7.46666700	\N	\N	f
1145	Doncaster	D5	71	53.55000000	-1.13333300	\N	\N	f
1146	Ballymoney	R1	71	55.11666700	-6.33333300	\N	\N	f
1147	Fermanagh	S2	71	54.28333300	-7.68333300	\N	\N	f
1149	Nottingham	J8	71	53.00000000	-1.13333300	\N	\N	f
1151	Tameside	O1	71	53.50000000	-2.10000000	\N	\N	f
1152	Rutland	L4	71	52.70000000	-0.71666700	\N	\N	f
1153	Nottinghamshire	J9	71	52.85000000	-0.38333300	\N	\N	f
1154	Midlothian	V5	71	55.83333300	-3.18333300	\N	\N	f
1155	East Ayrshire	U4	71	55.46666700	-4.30000000	\N	\N	f
1156	Stoke-on-Trent	N4	71	53.05000000	-2.30000000	\N	\N	f
1157	Bristol	B7	71	51.51055600	-2.69305600	\N	\N	f
1158	Flintshire	Y1	71	53.26666700	-3.16666700	\N	\N	f
1159	Blackburn with Darwen	A8	71	53.78333300	-2.56666700	\N	\N	f
1160	Moyle	S8	71	55.23333300	-6.35000000	\N	\N	f
1161	Carrickfergus	R4	71	54.76666700	-5.76666700	\N	\N	f
1162	Castlereagh	R5	71	54.50000000	-5.80000000	\N	\N	f
1163	Larne	S3	71	54.83333300	-5.78333300	\N	\N	f
1164	Belfast	R3	71	54.60000000	-5.90000000	\N	\N	f
1165	Magherafelt	S7	71	54.71666700	-6.53333300	\N	\N	f
1166	North Down	T2	71	54.65000000	-5.70000000	\N	\N	f
1167	North Somerset	J4	71	51.32861100	-2.86388900	\N	\N	f
1168	East Renfrewshire	U7	71	55.78333300	-4.38333300	\N	\N	f
1169	Newport	Y6	71	51.57777800	-3.05333300	\N	\N	f
1170	Bath and North East Somerset	A4	71	51.39222200	-2.32222200	\N	\N	f
1173	Newham	I8	71	51.51666700	-0.05000000	\N	\N	f
1175	Denbighshire	X9	71	53.00000000	-3.43333300	\N	\N	f
1176	East Riding of Yorkshire	E1	71	53.83333300	-0.41666700	\N	\N	f
1177	Bexley	A6	71	51.45000000	0.15000000	\N	\N	f
1178	Bromley	B8	71	51.38333300	0.03333300	\N	\N	f
1179	Bradford	B4	71	53.76666700	-1.73333300	\N	\N	f
1180	Bracknell Forest	B3	71	51.43333300	-0.78333300	\N	\N	f
1181	Cardiff	X5	71	51.51194400	-3.20861100	\N	\N	f
1182	Birmingham	A7	71	52.46666700	-1.91666700	\N	\N	f
1183	Orkney	V9	71	59.13333300	-3.31666700	\N	\N	f
1184	East Dunbartonshire	U5	71	55.90000000	-4.23333300	\N	\N	f
1185	Blackpool	A9	71	53.85000000	-3.05000000	\N	\N	f
1186	Southampton	M4	71	50.90000000	-1.35000000	\N	\N	f
1187	Newcastle upon Tyne	I7	71	54.96666700	-1.70000000	\N	\N	f
1188	Bolton	B1	71	53.58333300	-2.43333300	\N	\N	f
1189	Redcar and Cleveland	K9	71	54.53333300	-0.96666700	\N	\N	f
1190	Bournemouth	B2	71	50.71666700	-1.88333300	\N	\N	f
1191	Swindon	N9	71	51.56666700	-1.66666700	\N	\N	f
1192	Stockport	N2	71	53.36666700	-2.16666700	\N	\N	f
1193	Windsor and Maidenhead	P9	71	51.50000000	-0.70000000	\N	\N	f
1194	Inverclyde	V4	71	55.85000000	-4.58333300	\N	\N	f
1195	Medway	I3	71	51.40000000	0.53333300	\N	\N	f
1196	Milton Keynes	I6	71	52.05000000	-0.68333300	\N	\N	f
1197	Dundee City	U3	71	56.46666700	-2.86666700	\N	\N	f
1198	Telford and Wrekin	O2	71	52.63333300	-2.53333300	\N	\N	f
1199	Reading	K7	71	51.40000000	-1.03333300	\N	\N	f
1200	Bury	C1	71	53.60000000	-2.30000000	\N	\N	f
1201	Wolverhampton	Q3	71	52.61666700	-2.11666700	\N	\N	f
1202	Southwark	M8	71	51.40000000	-0.15000000	\N	\N	f
1203	Camden	C4	71	51.46666700	-0.20000000	\N	\N	f
1204	Slough	M1	71	51.51666700	-0.60000000	\N	\N	f
1205	Middlesbrough	I5	71	54.58333300	-1.20000000	\N	\N	f
1206	Stockton-on-Tees	N3	71	54.58333300	-1.40000000	\N	\N	f
1207	Newtownabbey	T1	71	54.68333300	-5.95000000	\N	\N	f
1208	Lisburn	S5	71	54.48333300	-5.93333300	\N	\N	f
1210	Lewisham	H6	71	51.45000000	-0.01666700	\N	\N	f
1211	West Berkshire	P4	71	51.45000000	-1.31666700	\N	\N	f
1212	Manchester	I2	71	53.46666700	-2.21666700	\N	\N	f
1213	Westminster	P5	71	51.50000000	-0.11666700	\N	\N	f
1214	Ards	Q7	71	54.55000000	-5.70000000	\N	\N	f
1215	Plymouth	K4	71	50.41666700	-4.13333300	\N	\N	f
1216	Croydon	C8	71	51.38333300	-0.10000000	\N	\N	f
1217	Barking and Dagenham	A1	71	51.55000000	0.16666700	\N	\N	f
1218	Hartlepool	F5	71	54.68333300	-1.26666700	\N	\N	f
1219	Sheffield	L9	71	53.38333300	-1.41666700	\N	\N	f
1220	Oldham	K1	71	53.56666700	-2.01666700	\N	\N	f
1221	Knowsley	G9	71	53.43333300	-2.88333300	\N	\N	f
1222	Liverpool	H8	71	53.38333300	-2.95000000	\N	\N	f
1223	Dudley	D7	71	52.50000000	-2.08333300	\N	\N	f
1224	Gateshead	E5	71	54.95000000	-1.65000000	\N	\N	f
1225	Ealing	D9	71	51.50000000	-0.31666700	\N	\N	f
1226	Edinburgh	U8	71	55.96666700	-3.23333300	\N	\N	f
1227	Enfield	E3	71	51.66666700	-0.06666700	\N	\N	f
1228	Calderdale	C2	71	53.70000000	-1.85000000	\N	\N	f
1229	Halton	E9	71	53.38333300	-2.71666700	\N	\N	f
1230	North Tyneside	J5	71	55.01666700	-1.56666700	\N	\N	f
1231	Thurrock	O3	71	51.48333300	0.33333300	\N	\N	f
1232	North East Lincolnshire	J2	71	53.53333300	-0.05000000	\N	\N	f
1233	Wirral	Q1	71	53.40000000	-3.16666700	\N	\N	f
1234	Hackney	E8	71	51.55000000	-0.05000000	\N	\N	f
1235	Hammersmith and Fulham	F1	71	51.50000000	-0.23333300	\N	\N	f
1236	Havering	F6	71	51.58333300	0.23333300	\N	\N	f
1237	Harrow	F4	71	51.58333300	-0.31666700	\N	\N	f
1238	Barnet	A2	71	51.60000000	-0.21666700	\N	\N	f
1239	Hounslow	G1	71	51.46666700	-0.35000000	\N	\N	f
1240	Brighton and Hove	B6	71	50.83333300	-0.18333300	\N	\N	f
1241	Kingston upon Hull	G6	71	53.71666700	-0.33333300	\N	\N	f
1242	Redbridge	K8	71	51.55000000	0.05000000	\N	\N	f
1243	Islington	G3	71	51.53333300	-0.10000000	\N	\N	f
1244	Kensington and Chelsea	G4	71	51.48333300	-0.18333300	\N	\N	f
1245	Kingston upon Thames	G7	71	51.41666700	-0.28333300	\N	\N	f
1246	Lambeth	H1	71	51.48910000	-0.11070000	\N	\N	f
1247	London	H9	71	51.50020000	-0.12620000	\N	\N	f
1248	Luton	I1	71	51.88333300	-0.41666700	\N	\N	f
1249	Sunderland	N6	71	54.91666700	-1.38333300	\N	\N	f
1250	Merton	I4	71	51.38333300	-0.20000000	\N	\N	f
1251	Sandwell	L7	71	52.50000000	-2.01666700	\N	\N	f
1252	Salford	L5	71	53.51666700	-2.33333300	\N	\N	f
1253	Peterborough	K3	71	52.58333300	-0.25000000	\N	\N	f
1254	Poole	K5	71	50.71666700	-2.00000000	\N	\N	f
1255	Tower Hamlets	O5	71	51.50000000	-0.01666700	\N	\N	f
1256	Portsmouth	K6	71	50.79670000	-1.08333300	\N	\N	f
1257	Rochdale	L2	71	53.61666700	-2.15000000	\N	\N	f
1258	Greenwich	E7	71	51.46666700	0.20000000	\N	\N	f
1259	South Tyneside	M7	71	54.98777800	-1.42138900	\N	\N	f
1260	Trafford	O6	71	53.45000000	-2.31666700	\N	\N	f
1261	Sutton	N8	71	51.35000000	-0.20000000	\N	\N	f
1262	Torbay	O4	71	50.45000000	-3.50000000	\N	\N	f
1263	Richmond upon Thames	L1	71	51.43333300	-0.31666700	\N	\N	f
1264	Hillingdon	F9	71	51.55000000	-0.48333300	\N	\N	f
1265	Wakefield	O7	71	53.70000000	-1.48333300	\N	\N	f
1266	Waltham Forest	O9	71	51.60000000	-0.03333300	\N	\N	f
1267	Wandsworth	P1	71	51.45000000	-0.20000000	\N	\N	f
1268	Brent	B5	71	51.55000000	-0.28333300	\N	\N	f
1269	Haringey	F3	71	51.60000000	-0.11666700	\N	\N	f
1270	Saint Andrew	01	72	12.10000000	-61.66666670	\N	\N	f
1271	Saint George	03	72	12.00000000	-61.75000000	\N	\N	f
1272	Saint David	02	72	12.05000000	-61.66666670	\N	\N	f
1273	Saint Patrick	06	72	12.45000000	-61.48333330	\N	\N	f
1274	Saint Mark	05	72	12.18333330	-61.68333330	\N	\N	f
1275	Saint John	04	72	12.16666670	-61.73333330	\N	\N	f
1276	Abkhazia	02	73	43.12694440	40.73888890	\N	\N	f
1277	Ninotsmindis Raioni	39	73	42.52694440	43.76250000	\N	\N	f
1278	Poti	42	73	42.60388890	44.38888890	\N	\N	f
1279	Ambrolauris Raioni	09	73	42.54222220	43.01333330	\N	\N	f
1280	Abashis Raioni	01	73	42.19416670	42.22416670	\N	\N	f
1281	Akhaltsikhis Raioni	07	73	41.75611110	42.84111110	\N	\N	f
1282	Zestaponis Raioni	62	73	42.40111110	41.88888890	\N	\N	f
1283	Tsalenjikhis Raioni	58	73	41.42833330	44.43111110	\N	\N	f
1284	Marneulis Raioni	35	73	42.39055560	42.30333330	\N	\N	f
1285	Goris Raioni	22	73	41.57222220	44.49166670	\N	\N	f
1286	Karelis Raioni	25	73	42.08777780	43.76805560	\N	\N	f
1287	Khashuris Raioni	28	73	42.10000000	43.73333330	\N	\N	f
1288	Kaspis Raioni	26	73	42.05555560	44.36138890	\N	\N	f
1289	Ajaria	04	73	41.65000000	42.03333330	\N	\N	f
1290	Mtskhetis Raioni	38	73	41.40000000	43.61666670	\N	\N	f
1291	Chokhatauris Raioni	16	73	42.05250000	42.35611110	\N	\N	f
1292	Akhalkalakis Raioni	06	73	41.41250000	43.47777780	\N	\N	f
1293	Samtrediis Raioni	48	73	42.26888890	42.07916670	\N	\N	f
1294	Tqibuli	56	73	42.55777780	42.85916670	\N	\N	f
1295	Dushetis Raioni	19	73	42.51083330	44.97722220	\N	\N	f
1296	Onis Raioni	40	73	41.83916670	42.02333330	\N	\N	f
1297	Lentekhis Raioni	34	73	43.41750000	40.21555560	\N	\N	f
1298	Martvilis Raioni	36	73	42.99750000	42.91500000	\N	\N	f
1299	Kutaisi	31	73	41.66305560	45.89638890	\N	\N	f
1300	Akhalgoris Raioni	05	73	42.20555560	44.36444440	\N	\N	f
1301	Aspindzis Raioni	10	73	41.36666670	43.21666670	\N	\N	f
1302	Akhmetis Raioni	08	73	41.71666670	45.26666670	\N	\N	f
1303	Lagodekhis Raioni	32	73	42.01111110	42.08944440	\N	\N	f
1304	Zugdidis Raioni	64	73	42.37777780	42.52666670	\N	\N	f
1305	Borjomis Raioni	13	73	41.92305560	43.48694440	\N	\N	f
1306	Tianetis Raioni	55	73	42.36472220	42.90777780	\N	\N	f
1307	Khobis Raioni	29	73	42.43055560	42.04027780	\N	\N	f
1308	Kharagaulis Raioni	27	73	42.01944440	43.15444440	\N	\N	f
1309	Vanis Raioni	61	73	42.10000000	42.95000000	\N	\N	f
1310	Telavis Raioni	52	73	42.21583330	42.98777780	\N	\N	f
1311	Tsalkis Raioni	59	73	42.30000000	42.50000000	\N	\N	f
1312	Qazbegis Raioni	43	73	41.90472220	45.97694440	\N	\N	f
1313	Sagarejos Raioni	47	73	42.16388890	42.39111110	\N	\N	f
1314	Tetritsqaros Raioni	54	73	42.13027780	44.99722220	\N	\N	f
1315	Dedoplistsqaros Raioni	17	73	41.38250000	46.14333330	\N	\N	f
1316	Javis Raioni	24	73	42.54611110	44.17666670	\N	\N	f
1317	Chkhorotsqus Raioni	15	73	42.45916670	42.17527780	\N	\N	f
1318	Tsqaltubo	60	73	42.09027780	42.64000000	\N	\N	f
1319	Rustavi	45	73	42.30222220	43.48388890	\N	\N	f
1320	Tbilisi	51	73	42.07250000	45.50361110	\N	\N	f
1321	Baghdatis Raioni	11	73	42.08472220	42.82500000	\N	\N	f
1322	Lanchkhutis Raioni	33	73	42.83055560	42.49166670	\N	\N	f
1323	Chiatura	14	73	42.18333330	43.38333330	\N	\N	f
1324	Tsageris Raioni	57	73	42.70222220	42.04250000	\N	\N	f
1327	Central	04	76	5.20000000	-1.08333330	\N	\N	f
1328	Western	09	76	6.21666670	-0.83333330	\N	\N	f
1329	Ashanti	02	76	7.95000000	-1.18333330	\N	\N	f
1330	Upper East	10	76	10.98333330	-0.75000000	\N	\N	f
1331	Volta	08	76	6.15000000	0.11666670	\N	\N	f
1332	Brong-Ahafo	03	76	7.61666670	-1.93333330	\N	\N	f
1333	Northern	06	76	8.33333330	0.13333330	\N	\N	f
1334	Greater Accra	01	76	5.55000000	-0.21666670	\N	\N	f
1335	Upper West	11	76	10.66666670	-1.56666670	\N	\N	f
1336	Eastern	05	76	6.08333330	-0.25000000	\N	\N	f
1338	Vestgronland	03	78	68.16666670	-52.83333330	\N	\N	f
1339	Nordgronland	01	78	77.41666670	-72.66666670	\N	\N	f
1340	Ostgronland	02	78	65.53333330	-37.20000000	\N	\N	f
1341	Central River	03	79	13.36666670	-14.61666670	\N	\N	f
1342	Western	05	79	13.40416670	-16.65583330	\N	\N	f
1343	North Bank	07	79	13.53333330	-15.81666670	\N	\N	f
1344	Upper River	04	79	13.31666670	-14.23333330	\N	\N	f
1345	Lower River	02	79	13.43333330	-15.45000000	\N	\N	f
1346	Banjul	01	79	13.45305560	-16.57750000	\N	\N	f
1347	Kouroussa	19	80	11.21666670	-10.50000000	\N	\N	f
1348	Beyla	01	80	8.66666670	-8.31666670	\N	\N	f
1349	Koundara	18	80	12.60000000	-13.11666670	\N	\N	f
1350	Dinguiraye	07	80	11.66666670	-10.75000000	\N	\N	f
1351	Mali	22	80	12.21666670	-12.58333330	\N	\N	f
1352	Macenta	21	80	8.71666670	-9.78333330	\N	\N	f
1355	Kissidougou	17	80	9.55000000	-10.10000000	\N	\N	f
1356	Forecariah	10	80	9.38250000	-13.22250000	\N	\N	f
1357	Pita	25	80	10.85000000	-12.36666670	\N	\N	f
1361	Dabola	05	80	10.76666670	-11.36666670	\N	\N	f
1362	Boke	03	80	10.70000000	-14.23333330	\N	\N	f
1363	Mamou	23	80	10.51666670	-11.73333330	\N	\N	f
1364	Faranah	09	80	9.95000000	-10.45000000	\N	\N	f
1365	Telimele	27	80	10.63333330	-13.08333330	\N	\N	f
1366	Boffa	02	80	9.97861110	-13.96888890	\N	\N	f
1367	Gueckedou	13	80	8.76666670	-10.30000000	\N	\N	f
1368	Kindia	16	80	10.25000000	-12.90000000	\N	\N	f
1369	Fria	11	80	10.60000000	-13.63333330	\N	\N	f
1370	Tougue	28	80	11.30000000	-11.36666670	\N	\N	f
1371	Yomou	29	80	7.37000000	-9.13194440	\N	\N	f
1372	Gaoual	12	80	11.93333330	-13.15000000	\N	\N	f
1373	Kerouane	15	80	9.21666670	-9.05000000	\N	\N	f
1374	Dalaba	06	80	11.08333330	-12.08333330	\N	\N	f
1375	Conakry	04	80	9.56666670	-13.63333330	\N	\N	f
1376	Coyah	30	80	9.70555560	-13.37694440	\N	\N	f
1377	Dubreka	31	80	9.79111110	-13.52333330	\N	\N	f
1378	Kankan	32	80	10.38333330	-9.30000000	\N	\N	f
1379	Koubia	33	80	11.58333330	-11.90000000	\N	\N	f
1380	Labe	34	80	11.31666670	-12.28333330	\N	\N	f
1381	Lelouma	35	80	11.18333330	-12.93333330	\N	\N	f
1382	Lola	36	80	7.80000000	-8.53333330	\N	\N	f
1383	Mandiana	37	80	10.63333330	-8.68333330	\N	\N	f
1384	Nzerekore	38	80	7.74722220	-8.82388890	\N	\N	f
1385	Siguiri	39	80	11.41666670	-9.16666670	\N	\N	f
1387	Centro Sur	06	82	1.66666670	10.63333330	\N	\N	f
1388	Wele-Nzas	09	82	1.20000000	11.28333330	\N	\N	f
1389	Kie-Ntem	07	82	1.83333330	10.86666670	\N	\N	f
1390	Litoral	08	82	1.45000000	9.63333330	\N	\N	f
1391	Annobon	03	82	-1.40138890	5.63250000	\N	\N	f
1392	Bioko Norte	04	82	3.55000000	8.85000000	\N	\N	f
1393	Bioko Sur	05	82	3.28333330	8.73333330	\N	\N	f
1395	Kilkis	06	83	41.27777780	22.78611110	\N	\N	f
1396	Larisa	21	83	39.48333330	22.60000000	\N	\N	f
1397	Attiki	35	83	38.08333330	23.73333330	\N	\N	f
1398	Trikala	22	83	39.45777780	21.31944440	\N	\N	f
1399	Preveza	19	83	39.25777780	20.59583330	\N	\N	f
1400	Kerkira	25	83	39.56444440	19.90500000	\N	\N	f
1401	Ioannina	17	83	39.45222220	20.77277780	\N	\N	f
1402	Pella	07	83	40.83527780	22.33583330	\N	\N	f
1403	Thessaloniki	13	83	40.43333330	23.03333330	\N	\N	f
1404	Voiotia	33	83	38.50000000	22.98333330	\N	\N	f
1405	Kikladhes	49	83	36.73333330	24.43333330	\N	\N	f
1406	Kavala	14	83	41.13333330	24.70000000	\N	\N	f
1407	Argolis	36	83	37.56666670	23.06666670	\N	\N	f
1408	Rethimni	44	83	35.36666670	24.56666670	\N	\N	f
1409	Serrai	05	83	41.01666670	23.46666670	\N	\N	f
1410	Lakonia	42	83	36.56666670	23.05000000	\N	\N	f
1411	Iraklion	45	83	35.15000000	25.03333330	\N	\N	f
1412	Lasithi	46	83	35.08333330	26.03333330	\N	\N	f
1413	Rodhopi	02	83	41.01666670	25.36666670	\N	\N	f
1414	Drama	04	83	41.13333330	24.26666670	\N	\N	f
1415	Messinia	40	83	36.86666670	21.86666670	\N	\N	f
1416	Evvoia	34	83	38.88333330	23.05000000	\N	\N	f
1417	Akhaia	38	83	38.24861110	22.08194440	\N	\N	f
1418	Magnisia	24	83	39.33333330	22.76666670	\N	\N	f
1419	Khania	43	83	35.36666670	23.60000000	\N	\N	f
1420	Kardhitsa	23	83	39.28583330	21.46694440	\N	\N	f
1421	Evros	01	83	40.90000000	26.00000000	\N	\N	f
1422	Arkadhia	41	83	37.40000000	22.60000000	\N	\N	f
1423	Aitolia kai Akarnania	31	83	38.43333330	21.35000000	\N	\N	f
1424	Kozani	11	83	40.66666670	21.55000000	\N	\N	f
1425	Thesprotia	18	83	39.58000000	20.39666670	\N	\N	f
1426	Lesvos	51	83	39.14805560	26.51444440	\N	\N	f
1427	Dhodhekanisos	47	83	36.30000000	28.15000000	\N	\N	f
1428	Kefallinia	27	83	38.15000000	20.75000000	\N	\N	f
1429	Khios	50	83	38.55444440	25.92500000	\N	\N	f
1430	Arta	20	83	39.21944440	21.30805560	\N	\N	f
1431	Grevena	10	83	40.03333330	21.61666670	\N	\N	f
1432	Zakinthos	28	83	37.71666670	20.78333330	\N	\N	f
1433	Evritania	30	83	38.86666670	21.61666670	\N	\N	f
1434	Fthiotis	29	83	39.10000000	22.20000000	\N	\N	f
1435	Kastoria	09	83	40.43750000	21.08138890	\N	\N	f
1436	Samos	48	83	37.69833330	26.61861110	\N	\N	f
1437	Imathia	12	83	40.59777780	22.21527780	\N	\N	f
1438	Florina	08	83	40.78416670	21.08083330	\N	\N	f
1439	Pieria	16	83	40.15277780	22.22666670	\N	\N	f
1440	Levkas	26	83	38.66666670	20.60000000	\N	\N	f
1441	Fokis	32	83	38.53333330	22.10000000	\N	\N	f
1442	Ilia	39	83	37.81666670	21.61666670	\N	\N	f
1443	Korinthia	37	83	37.83333330	22.58333330	\N	\N	f
1444	Xanthi	03	83	41.21666670	24.95000000	\N	\N	f
1445	Khalkidhiki	15	83	40.36666670	23.28333330	\N	\N	f
1448	Izabal	09	85	15.56666670	-89.30000000	\N	\N	f
1449	Alta Verapaz	01	85	15.45000000	-90.38333330	\N	\N	f
1450	Retalhuleu	15	85	14.36666670	-91.98333330	\N	\N	f
1451	El Progreso	05	85	14.91666670	-89.88333330	\N	\N	f
1452	Guatemala	07	85	14.61666670	-90.46666670	\N	\N	f
1453	Jutiapa	11	85	14.26527780	-90.12694440	\N	\N	f
1454	Chimaltenango	03	85	14.55194440	-90.94222220	\N	\N	f
1455	Chiquimula	04	85	14.58333330	-89.51666670	\N	\N	f
1456	Zacapa	22	85	15.13333330	-89.40000000	\N	\N	f
1457	Jalapa	10	85	14.53333330	-89.91666670	\N	\N	f
1458	San Marcos	17	85	15.23333330	-92.16666670	\N	\N	f
1459	Quiche	14	85	15.40500000	-91.18833330	\N	\N	f
1460	Huehuetenango	08	85	15.45222220	-91.49444440	\N	\N	f
1461	Quetzaltenango	13	85	14.86666670	-91.71666670	\N	\N	f
1462	Baja Verapaz	02	85	14.91666670	-90.40000000	\N	\N	f
1463	Santa Rosa	18	85	13.89611110	-90.45333330	\N	\N	f
1464	Solola	19	85	14.66666670	-91.11666670	\N	\N	f
1465	Peten	12	85	15.96666670	-89.73333330	\N	\N	f
1466	Escuintla	06	85	14.20000000	-91.05000000	\N	\N	f
1467	Sacatepequez	16	85	14.48027780	-90.80750000	\N	\N	f
1468	Totonicapan	21	85	14.81666670	-91.21666670	\N	\N	f
1469	Suchitepequez	20	85	14.51666670	-91.38333330	\N	\N	f
1470	Cacheu	06	86	11.16666670	-15.96666670	\N	\N	f
1471	Biombo	12	86	11.88333330	-15.78333330	\N	\N	f
1472	Oio	04	86	11.45000000	-15.70000000	\N	\N	f
1473	Bissau	11	86	11.86666670	-15.58333330	\N	\N	f
1474	Bafata	01	86	12.08333330	-14.48333330	\N	\N	f
1475	Tombali	07	86	11.33333330	-15.18333330	\N	\N	f
1476	Gabu	10	86	12.31666670	-14.40000000	\N	\N	f
1477	Bolama	05	86	11.56666670	-15.30000000	\N	\N	f
1478	Quinara	02	86	11.53333330	-15.08333330	\N	\N	f
1479	Mahaica-Berbice	15	87	6.55000000	-57.75000000	\N	\N	f
1480	Upper Takutu-Upper Essequibo	19	87	2.30000000	-59.58333330	\N	\N	f
1481	Barima-Waini	10	87	7.65000000	-58.93333330	\N	\N	f
1482	Pomeroon-Supenaam	16	87	7.08333330	-58.48333330	\N	\N	f
1483	Demerara-Mahaica	12	87	6.46666670	-58.16666670	\N	\N	f
1484	Cuyuni-Mazaruni	11	87	5.90000000	-60.56666670	\N	\N	f
1485	East Berbice-Corentyne	13	87	6.20000000	-57.28333330	\N	\N	f
1486	Essequibo Islands-West Demerara	14	87	6.50000000	-58.58333330	\N	\N	f
1487	Potaro-Siparuni	17	87	5.01666670	-59.53333330	\N	\N	f
1488	Upper Demerara-Berbice	18	87	5.08333330	-58.51666670	\N	\N	f
1490	Colon	03	89	15.73333330	-86.11666670	\N	\N	f
1491	Choluteca	02	89	13.38333330	-86.96666670	\N	\N	f
1492	Comayagua	04	89	14.68333330	-87.41666670	\N	\N	f
1493	Valle	17	89	13.55000000	-87.61666670	\N	\N	f
1494	Santa Barbara	16	89	15.15000000	-88.30000000	\N	\N	f
1495	Francisco Morazan	08	89	14.03333330	-87.50000000	\N	\N	f
1496	El Paraiso	07	89	13.71666670	-86.93333330	\N	\N	f
1497	Lempira	13	89	14.23333330	-88.75000000	\N	\N	f
1498	Copan	05	89	14.91666670	-89.03333330	\N	\N	f
1499	Olancho	15	89	14.43333330	-86.16666670	\N	\N	f
1500	Cortes	06	89	15.08333330	-88.10000000	\N	\N	f
1501	Yoro	18	89	15.00000000	-87.73333330	\N	\N	f
1502	Atlantida	01	89	15.68333330	-87.63333330	\N	\N	f
1503	Intibuca	10	89	14.18333330	-88.15000000	\N	\N	f
1504	La Paz	12	89	14.30000000	-87.90000000	\N	\N	f
1505	Ocotepeque	14	89	14.55000000	-89.26666670	\N	\N	f
1506	Gracias a Dios	09	89	15.48333330	-84.33333330	\N	\N	f
1507	Islas de la Bahia	11	89	16.43333330	-86.28333330	\N	\N	f
1508	Primorsko-Goranska	12	90	45.33916670	14.30833330	\N	\N	f
1509	Splitsko-Dalmatinska	15	90	43.72638890	16.63138890	\N	\N	f
1510	Istarska	04	90	45.29166670	13.61333330	\N	\N	f
1511	Osjecko-Baranjska	10	90	45.40555560	18.68361110	\N	\N	f
1512	Viroviticko-Podravska	17	90	45.93333330	17.50000000	\N	\N	f
1513	Grad Zagreb	21	90	45.90388890	16.17194440	\N	\N	f
1514	Sisacko-Moslavacka	14	90	45.15166670	16.37972220	\N	\N	f
1515	Licko-Senjska	08	90	44.36694440	15.40861110	\N	\N	f
1516	Brodsko-Posavska	02	90	45.24777780	17.46500000	\N	\N	f
1517	Dubrovacko-Neretvanska	03	90	43.23694440	17.28000000	\N	\N	f
1518	Pozesko-Slavonska	11	90	45.36250000	17.70583330	\N	\N	f
1519	Zagrebacka	20	90	44.04916670	15.60333330	\N	\N	f
1520	Bjelovarsko-Bilogorska	01	90	45.61361110	17.23083330	\N	\N	f
1521	Varazdinska	16	90	46.31472220	16.81194440	\N	\N	f
1522	Vukovarsko-Srijemska	18	90	45.26194440	18.91444440	\N	\N	f
1523	Krapinsko-Zagorska	07	90	46.00000000	15.95000000	\N	\N	f
1524	Koprivnicko-Krizevacka	06	90	46.14555560	16.57416670	\N	\N	f
1525	Karlovacka	05	90	45.09861110	15.65888890	\N	\N	f
1526	Sibensko-Kninska	13	90	44.05472220	16.02833330	\N	\N	f
1527	Medimurska	09	90	46.43333330	16.30000000	\N	\N	f
1529	Sud	12	91	18.03805560	-73.79250000	\N	\N	f
1530	Centre	07	91	18.76666670	-72.01666670	\N	\N	f
1532	Ouest	11	91	18.85000000	-73.01666670	\N	\N	f
1533	Nord	09	91	19.68333330	-72.25000000	\N	\N	f
1534	Nord-Ouest	03	91	19.82222220	-73.13333330	\N	\N	f
1535	Nord-Est	10	91	19.15000000	-71.78333330	\N	\N	f
1536	Sud-Est	13	91	18.28333330	-72.68333330	\N	\N	f
1537	Artibonite	06	91	19.05000000	-72.46666670	\N	\N	f
1538	Komarom-Esztergom	12	92	47.71666670	18.73333330	\N	\N	f
1539	Fejer	08	92	47.03333330	18.51666670	\N	\N	f
1540	Jasz-Nagykun-Szolnok	20	92	47.50000000	20.61666670	\N	\N	f
1541	Baranya	02	92	46.15000000	18.11666670	\N	\N	f
1542	Szabolcs-Szatmar-Bereg	18	92	47.70000000	21.88333330	\N	\N	f
1543	Heves	11	92	47.80000000	20.00000000	\N	\N	f
1544	Borsod-Abauj-Zemplen	04	92	48.31666670	21.23333330	\N	\N	f
1545	Gyor-Moson-Sopron	09	92	47.70000000	17.55000000	\N	\N	f
1546	Pest	16	92	47.18333330	20.00000000	\N	\N	f
1547	Veszprem	23	92	46.81666670	17.56666670	\N	\N	f
1548	Bacs-Kiskun	01	92	46.68333330	19.16666670	\N	\N	f
1549	Vas	22	92	47.31666670	16.73333330	\N	\N	f
1550	Hajdu-Bihar	10	92	47.15000000	21.51666670	\N	\N	f
1551	Zala	24	92	46.48333330	17.05000000	\N	\N	f
1552	Somogy	17	92	46.86666670	18.16666670	\N	\N	f
1553	Tolna	21	92	46.63333330	18.35000000	\N	\N	f
1554	Nograd	14	92	47.83333330	19.41666670	\N	\N	f
1555	Budapest	05	92	47.55000000	18.93333330	\N	\N	f
1556	Miskolc	13	92	48.10000000	20.58333330	\N	\N	f
1557	Csongrad	06	92	46.26666670	20.43333330	\N	\N	f
1558	Debrecen	07	92	47.60000000	21.65000000	\N	\N	f
1559	Bekes	03	92	47.13333330	21.08333330	\N	\N	f
1560	Szeged	19	92	46.25000000	20.16666670	\N	\N	f
1561	Pecs	15	92	46.11666670	18.28333330	\N	\N	f
1562	Gyor	25	92	47.68333330	17.63333330	\N	\N	f
1563	Jawa Timur	08	93	-7.39916700	112.79416700	\N	\N	f
1565	Sulawesi Tenggara	22	93	-3.80388900	122.43916700	\N	\N	f
1567	Nusa Tenggara Timur	18	93	-8.99027800	124.87138900	\N	\N	f
1568	Sulawesi Utara	31	93	0.63055600	121.81027800	\N	\N	f
1569	Sumatera Barat	24	93	-1.33333300	101.36666700	\N	\N	f
1570	Aceh	01	93	2.59090000	95.98980000	\N	\N	f
1571	Sulawesi Tengah	21	93	0.75250000	120.18388900	\N	\N	f
1575	Jawa Tengah	07	93	-7.75083300	110.66888900	\N	\N	f
1576	Jawa Barat	30	93	-6.95500000	107.75444400	\N	\N	f
1577	Bali	02	93	-8.51666700	115.21666700	\N	\N	f
1579	Banten	33	93	-6.31050000	106.17440000	\N	\N	f
1580	Sumatera Utara	26	93	0.80000000	99.56666700	\N	\N	f
1581	Kalimantan Timur	14	93	-0.25000000	115.35000000	\N	\N	f
1582	Lampung	15	93	-5.16416700	105.23972200	\N	\N	f
1583	Nusa Tenggara Barat	17	93	-8.71666700	118.50000000	\N	\N	f
1584	Kalimantan Barat	11	93	-1.06666700	110.06666700	\N	\N	f
1585	Kalimantan Tengah	13	93	-3.33333300	114.25000000	\N	\N	f
1587	Bengkulu	03	93	-3.36666700	102.46666700	\N	\N	f
1588	Jambi	05	93	-1.95000000	101.76666700	\N	\N	f
1589	Kalimantan Selatan	12	93	-2.46666700	115.20000000	\N	\N	f
1590	Yogyakarta	10	93	-8.03416700	110.45861100	\N	\N	f
1591	Jakarta Raya	04	93	-6.17166700	106.68972200	\N	\N	f
1593	Maluku	28	93	-1.93333300	124.38333300	\N	\N	f
1594	Galway	10	94	53.61666670	-9.66666670	\N	\N	f
1595	Cork	04	94	51.96666670	-8.58333330	\N	\N	f
1596	Kerry	11	94	52.35000000	-9.68333330	\N	\N	f
1597	Limerick	16	94	52.38138890	-9.30250000	\N	\N	f
1598	Longford	18	94	53.76666670	-7.45000000	\N	\N	f
1599	Laois	15	94	52.89916670	-7.35750000	\N	\N	f
1600	Waterford	27	94	52.09388890	-7.61138890	\N	\N	f
1601	Mayo	20	94	54.17166670	-9.16111110	\N	\N	f
1602	Sligo	25	94	54.06083330	-8.50361110	\N	\N	f
1603	Kildare	12	94	52.91388890	-6.82277780	\N	\N	f
1604	Dublin	07	94	53.39305560	-6.35500000	\N	\N	f
1605	Wicklow	31	94	52.85277780	-6.21694440	\N	\N	f
1606	Cavan	02	94	53.83388890	-7.07555560	\N	\N	f
1607	Kilkenny	13	94	52.73416670	-7.39888890	\N	\N	f
1608	Wexford	30	94	52.39416670	-6.71694440	\N	\N	f
1609	Carlow	01	94	52.84333330	-6.66333330	\N	\N	f
1610	Offaly	23	94	53.25611110	-7.60166670	\N	\N	f
1611	Monaghan	22	94	54.14972220	-7.08944440	\N	\N	f
1612	Leitrim	14	94	53.98055560	-7.69805560	\N	\N	f
1613	Clare	03	94	53.13916670	-9.21888890	\N	\N	f
1614	Donegal	06	94	54.99000000	-7.68388890	\N	\N	f
1615	Louth	19	94	54.04611110	-6.36805560	\N	\N	f
1616	Roscommon	24	94	54.03833330	-8.22361110	\N	\N	f
1617	Tipperary	26	94	53.03861110	-8.08638890	\N	\N	f
1618	Westmeath	29	94	53.48333330	-7.66666670	\N	\N	f
1619	Meath	21	94	53.41833330	-6.83527780	\N	\N	f
1620	HaZafon	03	95	33.04777780	35.17888890	\N	\N	f
1621	HaDarom	01	95	31.66666670	34.60000000	\N	\N	f
1622	HaMerkaz	02	95	32.03500000	34.88611110	\N	\N	f
1623	Yerushalayim	06	95	31.80000000	35.10000000	\N	\N	f
1624	Tel Aviv	05	95	32.05000000	34.76666670	\N	\N	f
1625	Hefa	04	95	32.78333330	34.98333330	\N	\N	f
1627	West Bengal	28	96	22.43277800	88.77777800	\N	\N	f
1628	Uttar Pradesh	36	96	29.58138900	77.39000000	\N	\N	f
1629	Punjab	23	96	31.31666700	75.56666700	\N	\N	f
1630	Madhya Pradesh	35	96	21.73333300	78.56666700	\N	\N	f
1631	Karnataka	19	96	15.58333300	75.76666700	\N	\N	f
1632	Maharashtra	16	96	19.66666700	76.88333300	\N	\N	f
1633	Haryana	10	96	30.10000000	77.28333300	\N	\N	f
1634	Uttarakhand	39	96	30.40416700	77.88722200	\N	\N	f
1635	Andhra Pradesh	02	96	17.32194400	78.69500000	\N	\N	f
1636	Tripura	26	96	24.35000000	92.30000000	\N	\N	f
1637	Tamil Nadu	25	96	12.78333300	79.66666700	\N	\N	f
1638	Jammu and Kashmir	12	96	34.53333300	75.26666700	\N	\N	f
1639	Andaman and Nicobar Islands	01	96	11.66666700	92.73333300	\N	\N	f
1640	Assam	03	96	27.03333300	94.33333300	\N	\N	f
1641	Chhattisgarh	37	96	21.05000000	81.71666700	\N	\N	f
1642	Rajasthan	24	96	24.60000000	72.70000000	\N	\N	f
1643	Goa	33	96	15.53333300	73.93333300	\N	\N	f
1644	Puducherry	22	96	10.88333300	79.83333300	\N	\N	f
1645	Gujarat	09	96	20.21666700	72.88333300	\N	\N	f
1646	Kerala	13	96	9.10000000	77.13333300	\N	\N	f
1647	Arunachal Pradesh	30	96	28.90000000	95.96666700	\N	\N	f
1648	Orissa	21	96	19.50000000	84.18333300	\N	\N	f
1649	Himachal Pradesh	11	96	30.49611100	77.75527800	\N	\N	f
1650	Bihar	34	96	26.95000000	84.96666700	\N	\N	f
1651	Meghalaya	18	96	25.43333300	90.23333300	\N	\N	f
1652	Nagaland	20	96	26.11666700	94.58333300	\N	\N	f
1653	Manipur	17	96	23.93333300	93.98333300	\N	\N	f
1654	Mizoram	31	96	23.72444400	92.71750000	\N	\N	f
1655	Jharkhand	38	96	23.68333300	85.75000000	\N	\N	f
1657	Delhi	07	96	28.80000000	77.15000000	\N	\N	f
1658	Dadra and Nagar Haveli	06	96	20.26666700	72.96666700	\N	\N	f
1660	Daman and Diu	32	96	20.45000000	72.88333300	\N	\N	f
1661	Sikkim	29	96	27.35000000	88.60000000	\N	\N	f
1662	Chandigarh	05	96	30.73722200	76.78722200	\N	\N	f
1663	Lakshadweep	14	96	10.56666700	72.61666700	\N	\N	f
1664	As Sulaymaniyah	05	97	35.17027780	46.03361110	\N	\N	f
1665	Dhi Qar	09	97	30.90750000	46.77555560	\N	\N	f
1666	Maysan	14	97	31.91666670	46.91666670	\N	\N	f
1667	Diyala	10	97	33.78027780	45.50555560	\N	\N	f
1668	Baghdad	07	97	33.33333330	44.40000000	\N	\N	f
1669	Wasit	16	97	33.01083330	44.69527780	\N	\N	f
1670	Salah ad Din	18	97	33.76722220	44.38027780	\N	\N	f
1671	Al Qadisiyah	04	97	32.10388890	45.30638890	\N	\N	f
1672	Babil	06	97	32.33333330	44.43333330	\N	\N	f
1673	Karbala	12	97	32.67944440	44.20500000	\N	\N	f
1674	An Najaf	17	97	32.07888890	44.44305560	\N	\N	f
1675	Al Muthanna	03	97	31.41444440	45.11555560	\N	\N	f
1676	Al Anbar	01	97	33.35583330	44.10555560	\N	\N	f
1677	Dahuk	08	97	37.13722220	42.70250000	\N	\N	f
1678	Ninawa	15	97	36.09416670	43.37916670	\N	\N	f
1679	Arbil	11	97	36.03805560	44.62944440	\N	\N	f
1680	Al Basrah	02	97	30.47888890	47.86750000	\N	\N	f
1681	At Tamim	13	97	35.36750000	44.05250000	\N	\N	f
1682	Zanjan	27	98	35.64111100	49.30972200	\N	\N	f
1683	Azarbayjan-e Bakhtari	01	98	38.56666700	45.06666700	\N	\N	f
1684	Yazd	31	98	32.15000000	48.21666700	\N	\N	f
1685	Khuzestan	15	98	32.14460000	48.20650000	\N	\N	f
1686	Esfahan	28	98	32.59305600	51.74916700	\N	\N	f
1687	Ardabil	32	98	38.32270000	48.31190000	\N	\N	f
1688	Tehran	26	98	35.61583300	52.09138900	\N	\N	f
1689	East Azarbaijan	33	98	37.37040000	48.13770000	\N	\N	f
1690	Bushehr	22	98	29.02830000	51.24920000	\N	\N	f
1691	Hormozgan	11	98	27.21888900	55.80527800	\N	\N	f
1692	Mazandaran	17	98	37.41916700	55.25388900	\N	\N	f
1693	Kerman	29	98	28.58333300	58.53333300	\N	\N	f
1694	Fars	07	98	31.03333300	52.83333300	\N	\N	f
1695	Kohkiluyeh va Buyer Ahmadi	05	98	30.95555600	50.92472200	\N	\N	f
1696	Khorasan	30	98	34.64472200	59.24305600	\N	\N	f
1697	Sistan va Baluchestan	04	98	29.00222200	58.05111100	\N	\N	f
1698	Chahar Mahall va Bakhtiari	03	98	31.38638900	51.07611100	\N	\N	f
1699	Kerman	12	98	30.76666700	56.83333300	\N	\N	f
1700	Mazandaran	35	98	36.61666700	52.26666700	\N	\N	f
1701	Qazvin	38	98	36.10040000	49.53120000	\N	\N	f
1702	Zanjan	36	98	36.12860000	48.13450000	\N	\N	f
1703	Markazi	24	98	33.84333300	49.04805600	\N	\N	f
1704	Markazi	19	98	34.60000000	49.08333300	\N	\N	f
1705	Lorestan	23	98	33.21370000	47.85980000	\N	\N	f
1706	Markazi	34	98	35.23861100	51.76861100	\N	\N	f
1707	Khorasan-e Razavi	42	98	36.38830000	59.27250000	\N	\N	f
1708	Hamadan	09	98	34.69277800	48.23972200	\N	\N	f
1709	Semnan	25	98	36.58111100	54.91944400	\N	\N	f
1710	Gilan	08	98	37.36638900	49.25750000	\N	\N	f
1711	Kordestan	16	98	35.92260000	46.64420000	\N	\N	f
1712	Bakhtaran	13	98	34.50190000	47.61130000	\N	\N	f
1713	Ilam	10	98	33.11490000	47.35880000	\N	\N	f
1714	Semnan Province	18	98	35.90000000	54.11666700	\N	\N	f
1715	Golestan	37	98	36.88333300	54.78333300	\N	\N	f
1716	Qom	39	98	35.07170000	50.86630000	\N	\N	f
1718	Zanjan	21	98	36.08333300	50.55000000	\N	\N	f
1720	Skagafjardarsysla	28	99	65.30000000	-18.86666700	\N	\N	f
1721	Borgarfjardarsysla	07	99	64.31666700	-22.10000000	\N	\N	f
1722	Myrasysla	17	99	64.63333300	-22.38333300	\N	\N	f
1723	Rangarvallasysla	23	99	63.66666700	-20.38333300	\N	\N	f
1724	Eyjafjardarsysla	09	99	65.66666700	-18.10000000	\N	\N	f
1725	Kjosarsysla	15	99	64.16666700	-21.68333300	\N	\N	f
1726	Vestur-Isafjardarsysla	36	99	65.78333300	-23.71666700	\N	\N	f
1728	Strandasysla	30	99	66.01666700	-21.51666700	\N	\N	f
1729	Gullbringusysla	10	99	64.01666700	-22.35000000	\N	\N	f
1730	Austur-Hunavatnssysla	05	99	65.50000000	-20.03333300	\N	\N	f
1731	Austur-Skaftafellssysla	06	99	64.38333300	-14.80000000	\N	\N	f
1732	Nordur-Mulasysla	20	99	66.03333300	-14.80000000	\N	\N	f
1733	Sudur-Mulasysla	31	99	64.70000000	-14.26666700	\N	\N	f
1734	Vestur-Bardastrandarsysla	34	99	65.68333300	-23.60000000	\N	\N	f
1735	Snafellsnes- og Hnappadalssysla	29	99	65.00000000	-22.96666700	\N	\N	f
1736	Arnessysla	03	99	64.16666700	-20.38333300	\N	\N	f
1737	Vestur-Hunavatnssysla	35	99	65.45000000	-20.71666700	\N	\N	f
1738	Sudur-Tingeyjarsysla	32	99	66.11666700	-17.91666700	\N	\N	f
1740	Vestur-Skaftafellssysla	37	99	63.41666700	-19.16666700	\N	\N	f
1742	Nordur-Tingeyjarsysla	21	99	66.06666700	-16.76666700	\N	\N	f
1743	Toscana	16	100	43.38333300	11.20000000	\N	\N	f
1744	Veneto	20	100	45.35000000	11.78333300	\N	\N	f
1745	Campania	04	100	40.13333300	15.35000000	\N	\N	f
1746	Marche	10	100	43.21666700	13.40000000	\N	\N	f
1747	Piemonte	12	100	45.03333300	6.83333300	\N	\N	f
1748	Lombardia	09	100	45.90000000	9.33333300	\N	\N	f
1749	Sardegna	14	100	40.13333300	8.81666700	\N	\N	f
1750	Abruzzi	01	100	42.21666700	14.00000000	\N	\N	f
1751	Emilia-Romagna	05	100	44.83472200	12.18277800	\N	\N	f
1752	Trentino-Alto Adige	17	100	46.76666700	11.36666700	\N	\N	f
1753	Umbria	18	100	42.83333300	13.05000000	\N	\N	f
1754	Basilicata	02	100	40.50000000	15.81666700	\N	\N	f
1755	Puglia	13	100	40.33333300	18.28333300	\N	\N	f
1756	Sicilia	15	100	37.03333300	14.46666700	\N	\N	f
1757	Lazio	07	100	41.45000000	12.75000000	\N	\N	f
1758	Liguria	08	100	44.41666700	9.25000000	\N	\N	f
1759	Calabria	03	100	39.90000000	16.00000000	\N	\N	f
1760	Molise	11	100	41.86666700	14.75000000	\N	\N	f
1761	Friuli-Venezia Giulia	06	100	46.11666700	13.24277800	\N	\N	f
1762	Valle dAosta	19	100	45.71666700	7.13333300	\N	\N	f
1764	Saint Ann	09	101	18.38333330	-77.36666670	\N	\N	f
1765	Saint Elizabeth	11	101	18.20000000	-77.70000000	\N	\N	f
1766	Hanover	02	101	18.38333330	-78.30000000	\N	\N	f
1767	Westmoreland	16	101	18.11666670	-77.98333330	\N	\N	f
1768	Trelawny	15	101	18.43333330	-77.65000000	\N	\N	f
1769	Manchester	04	101	18.11666670	-77.60000000	\N	\N	f
1770	Saint James	12	101	18.45000000	-77.80000000	\N	\N	f
1771	Saint Andrew	08	101	17.98333330	-76.80000000	\N	\N	f
1772	Saint Thomas	14	101	17.90000000	-76.53333330	\N	\N	f
1773	Saint Mary	13	101	18.26666670	-76.80000000	\N	\N	f
1774	Portland	07	101	18.13333330	-76.61666670	\N	\N	f
1775	Clarendon	01	101	18.06666670	-77.28333330	\N	\N	f
1776	Saint Catherine	10	101	18.15000000	-77.05000000	\N	\N	f
1777	Kingston	17	101	17.96666670	-76.76666670	\N	\N	f
1779	At Tafilah	12	102	30.80000000	35.60000000	\N	\N	f
1782	Al Karak	09	102	31.13333330	35.75000000	\N	\N	f
1784	Al Balqa	02	102	32.20000000	35.63333330	\N	\N	f
1786	Amman	16	102	29.52666670	35.00777780	\N	\N	f
1787	Al Aqabah	21	102	29.55000000	35.13333330	\N	\N	f
1788	Okinawa	47	103	26.60611110	127.92388890	\N	\N	f
1789	Nagasaki	27	103	32.75000000	129.95000000	\N	\N	f
1790	Hokkaido	12	103	44.01972220	144.25861110	\N	\N	f
1791	Tokushima	39	103	33.78333330	134.63333330	\N	\N	f
1792	Mie	23	103	34.60000000	136.06666670	\N	\N	f
1793	Kanagawa	19	103	35.56861110	139.21861110	\N	\N	f
1794	Chiba	04	103	35.86666670	140.01666670	\N	\N	f
1795	Hyogo	13	103	34.78333330	134.58333330	\N	\N	f
1796	Yamaguchi	45	103	34.50000000	131.46666670	\N	\N	f
1797	Aomori	03	103	40.85000000	140.70000000	\N	\N	f
1798	Miyazaki	25	103	31.53333330	131.35000000	\N	\N	f
1799	Shizuoka	37	103	34.83333330	138.20000000	\N	\N	f
1800	Shimane	36	103	35.43333330	133.13333330	\N	\N	f
1801	Fukushima	08	103	37.48333330	140.26666670	\N	\N	f
1802	Okayama	31	103	34.46666670	133.80000000	\N	\N	f
1803	Shiga	35	103	35.36666670	136.03333330	\N	\N	f
1804	Kagoshima	18	103	27.81666670	128.90000000	\N	\N	f
1805	Hiroshima	11	103	34.23333330	132.60000000	\N	\N	f
1806	Tottori	41	103	35.35000000	133.33333330	\N	\N	f
1807	Akita	02	103	39.33333330	140.45000000	\N	\N	f
1808	Nagano	26	103	35.78333330	137.70000000	\N	\N	f
1809	Fukui	06	103	35.70000000	136.10000000	\N	\N	f
1810	Saitama	34	103	35.96972220	139.58861110	\N	\N	f
1811	Wakayama	43	103	33.60000000	135.48333330	\N	\N	f
1812	Kochi	20	103	33.51666670	134.16666670	\N	\N	f
1813	Iwate	16	103	38.96666670	141.21666670	\N	\N	f
1814	Miyagi	24	103	38.60000000	141.50000000	\N	\N	f
1815	Niigata	29	103	38.03333330	138.25000000	\N	\N	f
1816	Gumma	10	103	36.71666670	138.90000000	\N	\N	f
1817	Aichi	01	103	35.03333330	137.01666670	\N	\N	f
1818	Toyama	42	103	36.85000000	137.55000000	\N	\N	f
1819	Kumamoto	21	103	32.50000000	130.43333330	\N	\N	f
1820	Kagawa	17	103	34.38333330	134.13333330	\N	\N	f
1821	Ehime	05	103	33.03333330	132.40000000	\N	\N	f
1822	Tokyo	40	103	35.76666670	139.71666670	\N	\N	f
1823	Fukuoka	07	103	33.70000000	130.76666670	\N	\N	f
1824	Tochigi	38	103	36.66666670	139.45000000	\N	\N	f
1825	Yamagata	44	103	38.70722220	140.55194440	\N	\N	f
1826	Saga	33	103	33.25000000	130.30000000	\N	\N	f
1827	Oita	30	103	33.60000000	131.58333330	\N	\N	f
1828	Gifu	09	103	35.38333330	136.58333330	\N	\N	f
1829	Ishikawa	15	103	37.16666670	136.68333330	\N	\N	f
1830	Nara	28	103	34.20000000	135.98333330	\N	\N	f
1831	Ibaraki	14	103	36.03333330	140.20000000	\N	\N	f
1832	Kyoto	22	103	35.68333330	135.03333330	\N	\N	f
1833	Yamanashi	46	103	35.48333330	138.33333330	\N	\N	f
1834	Osaka	32	103	34.58333330	135.50000000	\N	\N	f
1835	Coast	02	104	-0.57472220	39.73472220	\N	\N	f
1836	Nyanza	07	104	-0.18333330	34.91666670	\N	\N	f
1837	Rift Valley	08	104	-0.30000000	35.28333330	\N	\N	f
1838	Western	09	104	0.23333330	34.70000000	\N	\N	f
1839	North-Eastern	06	104	2.95000000	39.70000000	\N	\N	f
1840	Eastern	03	104	0.65000000	37.68333330	\N	\N	f
1841	Nairobi Area	05	104	-1.28333330	36.85000000	\N	\N	f
1842	Central	01	104	-0.55000000	37.25000000	\N	\N	f
1843	Jalal-Abad	03	105	41.76666670	72.05000000	\N	\N	f
1844	Naryn	04	105	41.14222220	75.81111110	\N	\N	f
1845	Osh	05	105	39.48333330	72.48333330	\N	\N	f
1846	Chuy	02	105	42.80000000	75.26666670	\N	\N	f
1847	Ysyk-Kol	07	105	42.73333330	78.25000000	\N	\N	f
1848	Bishkek	01	105	42.93833330	74.48861110	\N	\N	f
1849	Talas	06	105	41.83333330	71.20000000	\N	\N	f
1850	Batken	09	105	40.18638890	71.05527780	\N	\N	f
1852	Siem Reap	16	106	13.50000000	103.60000000	\N	\N	f
1853	Kracheh	09	106	12.86666670	105.93333330	\N	\N	f
1854	Kampong Thum	05	106	12.68333330	104.95000000	\N	\N	f
1855	Kampong Chhnang	03	106	12.16666670	104.61666670	\N	\N	f
1857	Kampong Cham	02	106	11.78333330	105.10000000	\N	\N	f
1858	Kampong Speu	04	106	11.41666670	104.16666670	\N	\N	f
1859	Takeo	19	106	11.31666670	104.91666670	\N	\N	f
1860	Batdambang	01	106	13.26666670	102.76666670	\N	\N	f
1861	Prey Veng	14	106	11.03333330	105.20000000	\N	\N	f
1862	Ratanakiri Kiri	15	106	13.70000000	107.20000000	\N	\N	f
1863	Svay Rieng	18	106	11.36666670	105.80000000	\N	\N	f
1864	Koh Kong	08	106	11.18333330	103.48333330	\N	\N	f
1865	Pursat	12	106	12.76666670	103.65000000	\N	\N	f
1866	Phnum Penh	11	106	11.50000000	104.86666670	\N	\N	f
1867	Mondulkiri	10	106	13.08333330	106.41666670	\N	\N	f
1868	Stung Treng	17	106	13.66666670	105.63333330	\N	\N	f
1869	Kampot	06	106	10.66666670	103.90000000	\N	\N	f
1870	Banteay Meanchey	25	106	13.60500000	102.72444440	\N	\N	f
1871	Preah Vihear	13	106	13.78333330	104.96666670	\N	\N	f
1872	Kandal	07	106	11.45000000	104.93333330	\N	\N	f
1874	Anjouan	01	108	-12.73333330	45.05000000	\N	\N	f
1875	Moheli	03	108	-12.31666670	43.85000000	\N	\N	f
1876	Grande Comore	02	108	-11.41083330	43.29527780	\N	\N	f
1877	Saint George Gingerland	04	109	17.13333330	-62.51666670	\N	\N	f
1878	Saint James Windward	05	109	17.20000000	-62.55000000	\N	\N	f
1879	Saint Thomas Lowland	12	109	17.16666670	-62.60000000	\N	\N	f
1880	Saint George Basseterre	03	109	17.30000000	-62.71666670	\N	\N	f
1881	Saint John Figtree	07	109	17.13333330	-62.61666670	\N	\N	f
1882	Saint Peter Basseterre	11	109	17.33333330	-62.71666670	\N	\N	f
1883	Saint John Capisterre	06	109	17.40000000	-62.78333330	\N	\N	f
1884	Christ Church Nichola Town	01	109	17.38333330	-62.73333330	\N	\N	f
1885	Trinity Palmetto Point	15	109	17.28333330	-62.76666670	\N	\N	f
1886	Saint Anne Sandy Point	02	109	17.36666670	-62.81666670	\N	\N	f
1887	Saint Mary Cayon	08	109	17.35000000	-62.73333330	\N	\N	f
1888	Saint Thomas Middle Island	13	109	17.33333330	-62.81666670	\N	\N	f
1889	Saint Paul Capisterre	09	109	17.40000000	-62.83333330	\N	\N	f
1890	Pyongan-namdo	15	110	39.61777780	125.66472220	\N	\N	f
1891	Pyongan-bukto	11	110	40.16333330	125.52611110	\N	\N	f
1892	Pyongyang-si	12	110	38.96333330	125.64750000	\N	\N	f
1893	Kangwon-do	09	110	39.37777780	127.38027780	\N	\N	f
1894	Hwanghae-bukto	07	110	38.88527780	126.29388890	\N	\N	f
1895	Hamgyong-namdo	03	110	39.67333330	127.30611110	\N	\N	f
1896	Chagang-do	01	110	40.96666670	126.83333330	\N	\N	f
1897	Hamgyong-bukto	17	110	41.20000000	129.70000000	\N	\N	f
1898	Hwanghae-namdo	06	110	38.27888890	125.33027780	\N	\N	f
1899	Nampo-si	14	110	38.76888890	125.43388890	\N	\N	f
1900	Kaesong-si	08	110	38.19666670	126.82666670	\N	\N	f
1901	Yanggang-do	13	110	40.83361110	128.27805560	\N	\N	f
1902	Najin Sonbong-si	18	110	42.23388890	130.31611110	\N	\N	f
1903	Chungchong-bukto	05	111	36.70000000	127.78333330	\N	\N	f
1904	Kangwon-do	06	111	37.95000000	127.75944440	\N	\N	f
1905	Chungchong-namdo	17	111	36.72111110	126.13083330	\N	\N	f
1906	Kyongsang-bukto	14	111	36.18138890	128.11333330	\N	\N	f
1907	Cholla-namdo	16	111	34.76666670	126.10000000	\N	\N	f
1908	Kyonggi-do	13	111	37.93333330	127.60000000	\N	\N	f
1909	Cheju-do	01	111	33.46444440	126.31833330	\N	\N	f
1910	Cholla-bukto	03	111	35.48750000	127.57277780	\N	\N	f
1911	Seoul-tukpyolsi	11	111	37.55000000	126.95000000	\N	\N	f
1912	Kyongsang-namdo	20	111	34.81666670	128.51666670	\N	\N	f
1913	Taegu-jikhalsi	15	111	35.65000000	128.41666670	\N	\N	f
1914	Pusan-jikhalsi	10	111	35.06666670	129.01666670	\N	\N	f
1915	Kwangju-jikhalsi	18	111	35.21666670	126.80000000	\N	\N	f
1916	Ulsan-gwangyoksi	21	111	35.69000000	129.11944440	\N	\N	f
1917	Inchon-jikhalsi	12	111	37.77250000	126.42444440	\N	\N	f
1918	Taejon-jikhalsi	19	111	36.28333330	127.30000000	\N	\N	f
1919	Al Kuwayt	02	112	29.13222200	48.12611100	\N	\N	f
1920	Al Jahra	05	112	29.31444400	47.81194400	\N	\N	f
1923	Almaty	01	114	43.41555600	76.89833300	\N	\N	f
1924	South Kazakhstan	10	114	41.41277800	68.91777800	\N	\N	f
1925	North Kazakhstan	16	114	53.20972200	67.34805600	\N	\N	f
1926	Pavlodar	11	114	53.21027800	75.60833300	\N	\N	f
1927	Qaraghandy	12	114	49.48333300	73.74166700	\N	\N	f
1928	Qyzylorda	14	114	43.83472200	67.17694400	\N	\N	f
1929	East Kazakhstan	15	114	51.06666700	78.53333300	\N	\N	f
1930	Aqmola	03	114	50.72111100	69.52777800	\N	\N	f
1931	Aqtobe	04	114	50.77472200	61.79694400	\N	\N	f
1932	Qostanay	13	114	53.90611100	64.85972200	\N	\N	f
1933	West Kazakhstan	07	114	50.10000000	53.18333300	\N	\N	f
1934	Atyrau	06	114	47.06666700	53.80000000	\N	\N	f
1935	Zhambyl	17	114	45.00000000	72.78333300	\N	\N	f
1936	Astana	05	114	51.18111100	71.42777800	\N	\N	f
1937	Mangghystau	09	114	44.80000000	52.83333300	\N	\N	f
1938	Almaty City	02	114	43.25000000	76.95000000	\N	\N	f
1939	Bayqonyr	08	114	45.66666700	63.33333300	\N	\N	f
1941	Savannakhet	10	115	16.41666700	106.43333300	\N	\N	f
1942	Phongsali	08	115	21.40000000	102.21666700	\N	\N	f
1943	Saravan	09	115	16.28333300	106.91666700	\N	\N	f
1946	Houaphan	03	115	20.31138900	104.29444400	\N	\N	f
1947	Attapu	01	115	14.80000000	106.83333300	\N	\N	f
1949	Champasak	02	115	14.75000000	105.61666700	\N	\N	f
1950	Louangphrabang	17	115	19.97000000	102.24555600	\N	\N	f
1951	Oudomxai	07	115	21.06833300	102.05583300	\N	\N	f
1955	Xiangkhoang	14	115	19.60194400	102.97777800	\N	\N	f
1956	Vientiane	11	115	18.01527800	102.39666700	\N	\N	f
1960	Xaignabouri	13	115	18.13333300	101.38333300	\N	\N	f
1961	Khammouan	04	115	16.95000000	104.75000000	\N	\N	f
1966	Liban-Nord	03	116	34.35000000	35.83333330	\N	\N	f
1967	Al Janub	02	116	33.30000000	35.28333330	\N	\N	f
1968	Beyrouth	04	116	33.35972220	35.40277780	\N	\N	f
1969	Mont-Liban	05	116	34.10000000	35.85000000	\N	\N	f
1970	Beqaa	01	116	33.66666670	35.85000000	\N	\N	f
1971	Liban-Sud	06	116	33.56666670	35.40472220	\N	\N	f
1972	Micoud	08	117	13.81666670	-60.91666670	\N	\N	f
1973	Laborie	07	117	13.76666670	-61.00000000	\N	\N	f
1974	Dennery	05	117	13.90000000	-60.90000000	\N	\N	f
1975	Anse-la-Raye	01	117	13.93333330	-61.03333330	\N	\N	f
1976	Vieux-Fort	10	117	13.75000000	-60.96666670	\N	\N	f
1977	Castries	03	117	14.00000000	-60.93333330	\N	\N	f
1978	Soufriere	09	117	13.81666670	-61.05000000	\N	\N	f
1979	Gros-Islet	06	117	14.05000000	-60.96666670	\N	\N	f
1980	Choiseul	04	117	13.78333330	-61.03333330	\N	\N	f
1981	Dauphin	02	117	13.98333330	-60.91666670	\N	\N	f
1982	Praslin	11	117	13.83333330	-60.91666670	\N	\N	f
1983	Balzers	01	118	47.06666670	9.50000000	\N	\N	f
1984	Gamprin	03	118	47.21666670	9.50000000	\N	\N	f
1985	Planken	05	118	47.18333330	9.53333330	\N	\N	f
1986	Vaduz	11	118	47.15000000	9.51666670	\N	\N	f
1987	Eschen	02	118	47.21666670	9.51666670	\N	\N	f
1988	Triesenberg	10	118	47.13333330	9.53333330	\N	\N	f
1989	Schellenberg	08	118	47.23333330	9.53333330	\N	\N	f
1990	Mauren	04	118	47.21666670	9.53333330	\N	\N	f
1991	Ruggell	06	118	47.23333330	9.51666670	\N	\N	f
1992	Schaan	07	118	47.16666670	9.50000000	\N	\N	f
1993	Triesen	09	118	47.10000000	9.53333330	\N	\N	f
1994	North Western	32	119	7.65000000	80.33333330	\N	\N	f
1995	Southern	34	119	6.18333330	80.80000000	\N	\N	f
1996	Central	29	119	7.31666670	80.66666670	\N	\N	f
1997	Sabaragamuwa	33	119	7.31666670	80.31666670	\N	\N	f
1998	North Central	30	119	8.01666670	80.46666670	\N	\N	f
2000	Western	36	119	6.45000000	80.01666670	\N	\N	f
2001	Uva	35	119	6.75000000	81.50000000	\N	\N	f
2002	Nimba	09	120	6.53333330	-8.85000000	\N	\N	f
2003	Grand Bassa	11	120	6.00000000	-9.83333330	\N	\N	f
2004	Lofa	05	120	8.35000000	-9.71666670	\N	\N	f
2005	Bong	01	120	6.65000000	-9.55000000	\N	\N	f
2007	Montserrado	14	120	6.65777780	-10.59750000	\N	\N	f
2009	Margibi	17	120	6.62861110	-10.07972220	\N	\N	f
2011	Sino	10	120	4.94305560	-8.90166670	\N	\N	f
2012	River Cess	18	120	6.13277780	-9.23555560	\N	\N	f
2013	Grand Cape Mount	12	120	6.71666670	-10.98333330	\N	\N	f
2015	Maryland	13	120	4.64416670	-7.68250000	\N	\N	f
2016	Grand Cape Mount	04	120	7.58333330	-10.63333330	\N	\N	f
2017	Gbarpolu	21	120	7.06666670	-10.48750000	\N	\N	f
2018	River Gee	22	120	5.19638890	-7.87555560	\N	\N	f
2019	Grand Gedeh	19	120	6.06666670	-8.12805560	\N	\N	f
2020	Lofa	20	120	8.42194440	-9.74777780	\N	\N	f
2021	Maseru	14	121	-29.63333330	27.65000000	\N	\N	f
2022	Quthing	18	121	-30.40000000	27.61666670	\N	\N	f
2023	Mafeteng	13	121	-29.71666670	27.35000000	\N	\N	f
2024	Berea	10	121	-29.23333330	27.61666670	\N	\N	f
2025	Mohales Hoek	15	121	-29.90000000	27.65000000	\N	\N	f
2026	Thaba-Tseka	19	121	-29.33333330	28.46666670	\N	\N	f
2027	Butha-Buthe	11	121	-28.78333330	28.23333330	\N	\N	f
2028	Leribe	12	121	-28.98333330	27.98333330	\N	\N	f
2029	Qachas Nek	17	121	-30.03333330	28.78333330	\N	\N	f
2030	Mokhotlong	16	121	-28.91666670	28.90000000	\N	\N	f
2032	Panevezio Apskritis	60	122	55.43333330	24.58333330	\N	\N	f
2033	Telsiu Apskritis	63	122	55.62055560	22.23000000	\N	\N	f
2034	Klaipedos Apskritis	58	122	56.00000000	21.20000000	\N	\N	f
2035	Vilniaus Apskritis	65	122	54.35000000	25.46666670	\N	\N	f
2036	Siauliu Apskritis	61	122	55.61666670	23.46666670	\N	\N	f
2037	Taurages Apskritis	62	122	55.08333330	22.46666670	\N	\N	f
2038	Marijampoles Apskritis	59	122	54.58333330	23.25000000	\N	\N	f
2040	Utenos Apskritis	64	122	55.15000000	26.60000000	\N	\N	f
2041	Alytaus Apskritis	56	122	54.56666670	24.33333330	\N	\N	f
2042	Kauno Apskritis	57	122	54.83333330	23.55000000	\N	\N	f
2043	Luxembourg	03	123	49.53361110	6.08083330	\N	\N	f
2044	Grevenmacher	02	123	49.62444440	6.42166670	\N	\N	f
2045	Diekirch	01	123	50.03666670	5.87083330	\N	\N	f
2046	Madonas	20	124	56.83333330	26.86666670	\N	\N	f
2047	Kuldigas	15	124	57.08333330	21.68333330	\N	\N	f
2048	Daugavpils	07	124	55.98333330	26.56666670	\N	\N	f
2049	Tukuma	29	124	56.95000000	22.96666670	\N	\N	f
2050	Ventspils	33	124	57.10000000	21.88333330	\N	\N	f
2051	Dobeles	08	124	56.47972220	23.26111110	\N	\N	f
2052	Liepajas	17	124	56.76666670	21.46666670	\N	\N	f
2053	Balvu	03	124	56.93333330	27.03333330	\N	\N	f
2054	Saldus	27	124	56.80000000	22.38333330	\N	\N	f
2055	Bauskas	04	124	56.53083330	23.60611110	\N	\N	f
2056	Limbazu	18	124	57.60138890	24.49527780	\N	\N	f
2057	Ludzas	19	124	56.50000000	28.00000000	\N	\N	f
2058	Cesu	05	124	57.13333330	26.00000000	\N	\N	f
2059	Jekabpils	10	124	56.20000000	25.61666670	\N	\N	f
2060	Aluksnes	02	124	57.43333330	26.66666670	\N	\N	f
2061	Rezeknes	24	124	56.56666670	27.36666670	\N	\N	f
2062	Rigas	26	124	57.09388890	24.36555560	\N	\N	f
2063	Ogres	21	124	56.85000000	25.33333330	\N	\N	f
2064	Kraslavas	14	124	55.91666670	27.41666670	\N	\N	f
2065	Gulbenes	09	124	57.08333330	26.51666670	\N	\N	f
2066	Riga	25	124	56.93972220	24.07388890	\N	\N	f
2067	Preilu	22	124	56.13333330	27.01666670	\N	\N	f
2068	Aizkraukles	01	124	56.73333330	26.70000000	\N	\N	f
2069	Talsu	28	124	57.66666670	22.56666670	\N	\N	f
2070	Jelgavas	12	124	56.69138890	23.79777780	\N	\N	f
2071	Valkas	30	124	57.70000000	26.18333330	\N	\N	f
2072	Valmieras	31	124	57.50000000	25.25000000	\N	\N	f
2073	Liepaja	16	124	56.55000000	21.10000000	\N	\N	f
2074	Ventspils	32	124	57.43416670	21.65611110	\N	\N	f
2075	Daugavpils	06	124	55.88333330	26.53333330	\N	\N	f
2076	Rezekne	23	124	56.50000000	27.41666670	\N	\N	f
2077	Yafran	62	125	32.05333330	12.56972220	\N	\N	f
2078	Tarabulus	61	125	32.85138890	13.44194440	\N	\N	f
2079	An Nuqat al Khams	51	125	32.72888890	12.50166670	\N	\N	f
2080	Al Aziziyah	03	125	32.26666670	13.01666670	\N	\N	f
2081	Az Zawiyah	53	125	32.75277780	12.63027780	\N	\N	f
2082	Misratah	58	125	30.58333330	15.40000000	\N	\N	f
2083	Gharyan	57	125	32.09972220	12.97861110	\N	\N	f
2084	Tubruq	42	125	32.03333330	23.68333330	\N	\N	f
2085	Tarhunah	41	125	32.43333330	13.46666670	\N	\N	f
2087	Ash Shati	13	125	27.51666670	13.95000000	\N	\N	f
2088	Ajdabiya	47	125	30.75916670	20.22305560	\N	\N	f
2089	Murzuq	30	125	25.96333330	13.53138890	\N	\N	f
2090	Al Jabal al Akhdar	49	125	32.68722220	21.91027780	\N	\N	f
2093	Ghadamis	56	125	31.90416670	10.81416670	\N	\N	f
2096	Awbari	52	125	26.75000000	14.01666670	\N	\N	f
2097	Al Khums	50	125	32.60111110	13.91333330	\N	\N	f
2099	Al Kufrah	08	125	21.56666670	24.83333330	\N	\N	f
2102	Al Fatih	48	125	32.56361110	21.24888890	\N	\N	f
2103	Banghazi	54	125	32.10000000	20.08333330	\N	\N	f
2104	Zlitan	45	125	32.45000000	14.56666670	\N	\N	f
2105	Al Jufrah	05	125	27.83333330	16.35000000	\N	\N	f
2108	Sawfajjin	59	125	31.75583330	14.01805560	\N	\N	f
2110	Darnah	55	125	32.25000000	20.06666670	\N	\N	f
2111	Sabha	34	125	27.05000000	14.40000000	\N	\N	f
2116	Surt	60	125	31.11777780	17.14750000	\N	\N	f
2166	Gagauzia	51	128	46.18666670	28.42472220	\N	\N	f
2175	Antananarivo	05	129	-18.05000000	47.78333330	\N	\N	f
2176	Mahajanga	03	129	-15.65000000	46.95000000	\N	\N	f
2177	Toliara	06	129	-22.61666670	44.65000000	\N	\N	f
2178	Fianarantsoa	02	129	-23.68333330	47.23333330	\N	\N	f
2179	Antsiranana	01	129	-13.20000000	48.95000000	\N	\N	f
2180	Toamasina	04	129	-19.00000000	48.56666670	\N	\N	f
2182	Petrovec	79	131	41.97805560	21.64944440	\N	\N	f
2183	Bogovinje	10	131	41.89472220	20.94250000	\N	\N	f
2184	Lozovo	60	131	41.76027780	21.98527780	\N	\N	f
2185	Rostusa	88	131	41.58888890	20.61305560	\N	\N	f
2186	Staro Nagoricane	97	131	42.25472220	21.85027780	\N	\N	f
2187	Gevgelija	33	131	41.13916670	22.50250000	\N	\N	f
2188	Srbinovo	94	131	41.72111110	21.00888890	\N	\N	f
2189	Orasac	75	131	42.04638890	21.68111110	\N	\N	f
2190	Valandovo	A8	131	41.34666670	22.53111110	\N	\N	f
2191	Ilinden	36	131	42.00638890	21.61027780	\N	\N	f
2192	Ohrid	74	131	41.11722220	20.80194440	\N	\N	f
2193	Sveti Nikole	A4	131	41.94500000	21.88166670	\N	\N	f
2194	Lipkovo	59	131	42.18611110	21.59027780	\N	\N	f
2195	Zitose	C4	131	41.36833330	21.29638890	\N	\N	f
2196	Studenicani	A2	131	41.80305560	21.42861110	\N	\N	f
2197	Krivogastani	53	131	41.33805560	21.40666670	\N	\N	f
2198	Radovis	84	131	41.69666670	22.47972220	\N	\N	f
2199	Dobrusevo	26	131	41.25888890	21.48111110	\N	\N	f
2200	Rankovce	85	131	42.20944440	21.99944440	\N	\N	f
2201	Topolcani	A7	131	41.15111110	21.50527780	\N	\N	f
2202	Kriva Palanka	52	131	42.28138890	22.26944440	\N	\N	f
2203	Zajas	C1	131	41.57722220	20.91833330	\N	\N	f
2204	Vitoliste	B5	131	41.15500000	21.94333330	\N	\N	f
2205	Debar	21	131	41.55166670	20.52666670	\N	\N	f
2206	Bosilovo	11	131	41.50138890	22.75638890	\N	\N	f
2207	Dzepciste	31	131	42.05333330	21.01916670	\N	\N	f
2208	Vasilevo	A9	131	41.47638890	22.61111110	\N	\N	f
2209	Star Dojran	96	131	41.25638890	22.66555560	\N	\N	f
2210	Saraj	90	131	42.00777780	21.35305560	\N	\N	f
2211	Aracinovo	01	131	42.02638890	21.56194440	\N	\N	f
2212	Oslomej	77	131	41.59472220	21.02444440	\N	\N	f
2213	Miravci	66	131	41.36666670	22.46666670	\N	\N	f
2214	Belcista	03	131	41.37055560	20.82888890	\N	\N	f
2215	Karbinci	40	131	41.81944440	22.27944440	\N	\N	f
2216	Krusevo	54	131	41.39638890	21.19833330	\N	\N	f
2217	Kondovo	48	131	41.97750000	21.27333330	\N	\N	f
2218	Resen	86	131	40.94361110	21.11305560	\N	\N	f
2219	Lukovo	61	131	41.37305560	20.66555560	\N	\N	f
2220	Vranestica	B6	131	41.45333330	21.03916670	\N	\N	f
2221	Negotino-Polosko	70	131	41.89444440	20.86222220	\N	\N	f
2222	Stip	98	131	41.75944440	22.20250000	\N	\N	f
2223	Sopotnica	93	131	41.29944440	21.07972220	\N	\N	f
2224	Orizari	76	131	42.01750000	22.41472220	\N	\N	f
2225	Veles	B1	131	41.68083330	21.80277780	\N	\N	f
2226	Bac	02	131	40.93333330	21.56666670	\N	\N	f
2227	Zelenikovo	C2	131	41.86444440	21.68805560	\N	\N	f
2228	Novo Selo	72	131	41.45000000	22.95000000	\N	\N	f
2229	Strumica	A1	131	41.30944440	22.70500000	\N	\N	f
2230	Mavrovi Anovi	64	131	41.74666670	20.78222220	\N	\N	f
2231	Novaci	71	131	41.01583330	21.53833330	\N	\N	f
2232	Gostivar	34	131	41.79083330	20.93805560	\N	\N	f
2233	Cucer-Sandevo	20	131	42.10805560	21.38805560	\N	\N	f
2234	Demir Kapija	25	131	41.40500000	22.24888890	\N	\N	f
2235	Oblesevo	73	131	41.91138890	22.33361110	\N	\N	f
2236	Caska	15	131	41.70055560	21.66555560	\N	\N	f
2237	Murtino	68	131	41.38388890	22.74361110	\N	\N	f
2238	Demir Hisar	24	131	41.25055560	21.22666670	\N	\N	f
2239	Probistip	83	131	41.98138890	22.06277780	\N	\N	f
2240	Makedonski Brod	63	131	41.50833330	21.27416670	\N	\N	f
2241	Karpos	41	131	42.02694440	21.37611110	\N	\N	f
2242	Bistrica	05	131	40.95000000	21.35000000	\N	\N	f
2243	Sopiste	92	131	41.94527780	21.34388890	\N	\N	f
2244	Kumanovo	57	131	42.14166670	21.69638890	\N	\N	f
2245	Kavadarci	42	131	41.36750000	21.99750000	\N	\N	f
2246	Prilep	82	131	41.33666670	21.70361110	\N	\N	f
2247	Kocani	46	131	41.92750000	22.38055560	\N	\N	f
2248	Samokov	89	131	41.67611110	21.30444440	\N	\N	f
2249	Klecevce	45	131	42.11527780	21.93000000	\N	\N	f
2250	Dolneni	28	131	41.41083330	21.39611110	\N	\N	f
2251	Dolna Banjica	27	131	41.77555560	20.93555560	\N	\N	f
2252	Vratnica	B8	131	42.13666670	21.10416670	\N	\N	f
2253	Mogila	67	131	41.15888890	21.35972220	\N	\N	f
2254	Berovo	04	131	41.70305560	22.85777780	\N	\N	f
2255	Brvenica	12	131	41.96722220	20.98083330	\N	\N	f
2256	Makedonska Kamenica	62	131	41.97250000	22.52805560	\N	\N	f
2257	Sipkovica	91	131	42.05333330	20.82805560	\N	\N	f
2258	Delogozdi	23	131	41.23000000	20.69833330	\N	\N	f
2259	Delcevo	22	131	41.96083330	22.67750000	\N	\N	f
2260	Vinica	B4	131	41.48555560	21.00000000	\N	\N	f
2261	Bogomila	09	131	41.61555560	21.51611110	\N	\N	f
2262	Bitola	06	131	41.03111110	21.34027780	\N	\N	f
2263	Blatec	07	131	41.83777780	22.57805560	\N	\N	f
2264	Cegrane	16	131	41.89500000	21.02027780	\N	\N	f
2265	Kratovo	51	131	42.05250000	22.21694440	\N	\N	f
2266	Bogdanci	08	131	41.20305560	22.57555560	\N	\N	f
2267	Konopiste	49	131	41.28805560	22.16166670	\N	\N	f
2268	Zelino	C3	131	42.00000000	21.19305560	\N	\N	f
2269	Labunista	58	131	41.28944440	20.59611110	\N	\N	f
2270	Suto Orizari	A3	131	42.06333330	21.43444440	\N	\N	f
2271	Tearce	A5	131	42.08583330	21.03888890	\N	\N	f
2272	Vrutok	B9	131	41.75527780	20.78388890	\N	\N	f
2273	Staravina	95	131	41.08194440	21.64055560	\N	\N	f
2274	Negotino	69	131	41.51083330	22.20750000	\N	\N	f
2275	Drugovo	30	131	41.44666670	20.90694440	\N	\N	f
2276	Zletovo	C5	131	41.92888890	22.19666670	\N	\N	f
2277	Pehcevo	78	131	41.76416670	22.77555560	\N	\N	f
2278	Cesinovo	19	131	41.84250000	22.29611110	\N	\N	f
2279	Capari	14	131	41.05611110	21.17833330	\N	\N	f
2280	Kukurecani	56	131	41.10305560	21.24472220	\N	\N	f
2281	Vrapciste	B7	131	41.81750000	20.88055560	\N	\N	f
2282	Rosoman	87	131	41.45972220	21.88194440	\N	\N	f
2283	Velesta	B2	131	41.21333330	20.63500000	\N	\N	f
2284	Konce	47	131	41.50416670	22.45694440	\N	\N	f
2285	Gradsko	35	131	41.57222220	21.96277780	\N	\N	f
2286	Kosel	50	131	41.15888890	20.79555560	\N	\N	f
2287	Kisela Voda	44	131	41.95750000	21.53750000	\N	\N	f
2288	Jegunovce	38	131	42.10194440	21.16000000	\N	\N	f
2289	Plasnica	80	131	41.49166670	21.13250000	\N	\N	f
2290	Kamenjane	39	131	41.96805560	20.92611110	\N	\N	f
2291	Izvor	37	131	41.47194440	21.78083330	\N	\N	f
2292	Struga	99	131	41.21555560	20.69305560	\N	\N	f
2293	Podares	81	131	41.54361110	22.54444440	\N	\N	f
2294	Tetovo	A6	131	42.01250000	20.94444440	\N	\N	f
2295	Meseista	65	131	41.19027780	20.75750000	\N	\N	f
2296	Vevcani	B3	131	41.22388890	20.55444440	\N	\N	f
2297	Zrnovci	C6	131	41.88083330	22.41916670	\N	\N	f
2298	Kicevo	43	131	41.50527780	20.96333330	\N	\N	f
2299	Kuklis	55	131	41.40527780	22.66527780	\N	\N	f
2300	Koulikoro	07	132	12.04444440	-8.62805560	\N	\N	f
2301	Mopti	04	132	15.28333330	-5.33333330	\N	\N	f
2302	Kayes	03	132	14.93333330	-11.75000000	\N	\N	f
2305	Tombouctou	08	132	16.08333330	-2.68333330	\N	\N	f
2306	Segou	05	132	13.33333330	-5.20000000	\N	\N	f
2307	Sikasso	06	132	10.60000000	-6.20000000	\N	\N	f
2308	Bamako	01	132	12.62555560	-7.98388890	\N	\N	f
2309	Gao	09	132	16.26666670	-0.05000000	\N	\N	f
2310	Kidal	10	132	18.44111110	1.40777780	\N	\N	f
2311	Pegu	09	133	17.65000000	96.73333330	\N	\N	f
2312	Mon State	13	133	15.25000000	97.81666670	\N	\N	f
2313	Kachin State	04	133	27.20000000	98.50000000	\N	\N	f
2314	Rakhine State	01	133	20.11666670	93.90000000	\N	\N	f
2315	Yangon	17	133	16.62055560	96.04555560	\N	\N	f
2316	Irrawaddy	03	133	16.21666670	95.70000000	\N	\N	f
2317	Tenasserim	12	133	12.56666670	98.80000000	\N	\N	f
2318	Karan State	05	133	17.28333330	97.63333330	\N	\N	f
2319	Sagaing	10	133	24.08333330	94.35000000	\N	\N	f
2320	Magwe	07	133	19.46666670	94.95000000	\N	\N	f
2321	Chin State	02	133	21.90000000	93.16666670	\N	\N	f
2322	Shan State	11	133	23.28333330	98.81666670	\N	\N	f
2323	Mandalay	08	133	20.46666670	95.98333330	\N	\N	f
2326	Kayah State	06	133	18.85000000	97.33333330	\N	\N	f
2328	Dornogovi	07	134	45.76666670	111.20000000	\N	\N	f
2329	Omnogovi	14	134	44.38333330	105.55000000	\N	\N	f
2330	Dundgovi	08	134	45.21666670	108.03333330	\N	\N	f
2331	Dzavhan	09	134	48.98333330	98.33333330	\N	\N	f
2332	Tov	18	134	47.16666670	107.16666670	\N	\N	f
2333	Suhbaatar	17	134	46.36666670	113.58333330	\N	\N	f
2334	Bulgan	21	134	47.90000000	103.41666670	\N	\N	f
2335	Arhangay	01	134	48.81666670	100.96666670	\N	\N	f
2336	Govisumber	24	134	46.58333330	108.61666670	\N	\N	f
2337	Hentiy	11	134	46.60000000	109.40000000	\N	\N	f
2338	Bayan-Olgiy	03	134	49.20000000	90.90000000	\N	\N	f
2339	Dornod	06	134	48.68333330	115.96666670	\N	\N	f
2340	Hovsgol	13	134	50.12138890	100.04305560	\N	\N	f
2341	Govi-Altay	10	134	44.91666670	95.41666670	\N	\N	f
2342	Hovd	12	134	45.80000000	92.28333330	\N	\N	f
2343	Selenge	16	134	50.31555560	106.49861110	\N	\N	f
2344	Bayanhongor	02	134	44.61666670	98.70000000	\N	\N	f
2345	Ulaanbaatar	20	134	47.90000000	107.00000000	\N	\N	f
2346	Ovorhangay	15	134	46.25000000	102.76666670	\N	\N	f
2347	Uvs	19	134	49.20000000	94.41666670	\N	\N	f
2348	Darhan-Uul	23	134	49.91500000	106.18666670	\N	\N	f
2349	Orhon	25	134	49.03333330	104.08333330	\N	\N	f
2350	Ilhas	01	135	22.20000000	113.55000000	\N	\N	f
2363	Brakna	05	138	16.36666670	-13.98333330	\N	\N	f
2364	Hodh Ech Chargui	01	138	15.56666670	-7.11666670	\N	\N	f
2365	Gorgol	04	138	16.23333330	-13.70000000	\N	\N	f
2366	Assaba	03	138	15.21666670	-10.95000000	\N	\N	f
2367	Guidimaka	10	138	15.56666670	-12.33333330	\N	\N	f
2368	Adrar	07	138	20.51666670	-13.16666670	\N	\N	f
2369	Hodh El Gharbi	02	138	15.73333330	-9.31666670	\N	\N	f
2370	Tiris Zemmour	11	138	25.93333330	-9.58333330	\N	\N	f
2371	Inchiri	12	138	19.75000000	-14.38333330	\N	\N	f
2372	Trarza	06	138	18.17722220	-15.87555560	\N	\N	f
2373	Dakhlet Nouadhibou	08	138	21.26666670	-16.50000000	\N	\N	f
2375	Tagant	09	138	18.55000000	-11.41666670	\N	\N	f
2376	Saint Anthony	01	139	16.70000000	-62.20000000	\N	\N	f
2377	Saint Peter	03	139	16.76666670	-62.20000000	\N	\N	f
2378	Saint Georges	02	139	16.71666670	-62.18333330	\N	\N	f
2380	Port Louis	18	141	-20.14805560	57.51611110	\N	\N	f
2381	Black River	12	141	-20.21166670	57.40083330	\N	\N	f
2382	Moka	15	141	-20.23972220	57.56638890	\N	\N	f
2383	Riviere du Rempart	19	141	-20.13083330	57.65916670	\N	\N	f
2384	Pamplemousses	16	141	-20.15000000	57.56666670	\N	\N	f
2385	Rodrigues	23	141	-19.67500000	63.43055560	\N	\N	f
2386	Grand Port	14	141	-20.34750000	57.74527780	\N	\N	f
2387	Flacq	13	141	-20.19805560	57.72944440	\N	\N	f
2388	Plaines Wilhems	17	141	-20.25055560	57.51333330	\N	\N	f
2389	Savanne	20	141	-20.48833330	57.37055560	\N	\N	f
2392	Seenu	01	142	-0.70000000	73.15000000	\N	\N	f
2393	Maale	40	142	4.16666670	73.50000000	\N	\N	f
2394	Nkhotakota	18	143	-12.75000000	34.21666670	\N	\N	f
2395	Rumphi	21	143	-11.20000000	33.83333330	\N	\N	f
2396	Mzimba	15	143	-12.16666670	33.48333330	\N	\N	f
2397	Lilongwe	11	143	-14.13333330	33.66666670	\N	\N	f
2398	Ntchisi	20	143	-13.40000000	33.90000000	\N	\N	f
2399	Salima	22	143	-13.78333330	34.46666670	\N	\N	f
2400	Mchinji	13	143	-13.65000000	33.16666670	\N	\N	f
2401	Chitipa	04	143	-9.51666670	33.21666670	\N	\N	f
2402	Ntcheu	16	143	-14.60000000	34.76666670	\N	\N	f
2403	Dowa	07	143	-13.51666670	33.86666670	\N	\N	f
2404	Kasungu	09	143	-12.56666670	33.45000000	\N	\N	f
2405	Zomba	23	143	-15.33333330	35.41666670	\N	\N	f
2406	Nsanje	19	143	-17.06666670	35.08333330	\N	\N	f
2407	Chikwawa	02	143	-16.21666670	34.66666670	\N	\N	f
2408	Thyolo	05	143	-16.46666670	34.95000000	\N	\N	f
2409	Dedza	06	143	-14.43333330	34.10000000	\N	\N	f
2410	Balaka	26	143	-14.76666670	34.91666670	\N	\N	f
2411	Mangochi	12	143	-14.66666670	35.41666670	\N	\N	f
2412	Machinga	28	143	-14.68333330	35.81666670	\N	\N	f
2413	Nkhata Bay	17	143	-11.95000000	34.16666670	\N	\N	f
2414	Chiradzulu	03	143	-15.53333330	35.21666670	\N	\N	f
2415	Blantyre	24	143	-15.78333330	35.00000000	\N	\N	f
2416	Karonga	08	143	-10.31666670	34.03333330	\N	\N	f
2417	Phalombe	30	143	-15.30000000	35.81666670	\N	\N	f
2418	Mwanza	25	143	-15.30000000	34.60000000	\N	\N	f
2419	Mulanje	29	143	-16.00000000	35.31666670	\N	\N	f
2420	Michoacan de Ocampo	16	144	19.98333300	-102.85000000	\N	\N	f
2421	Chihuahua	06	144	28.03333300	-107.70000000	\N	\N	f
2422	Veracruz-Llave	30	144	21.43333300	-97.58333300	\N	\N	f
2423	Yucatan	31	144	20.63333300	-89.68333300	\N	\N	f
2424	Quintana Roo	23	144	19.95000000	-88.86666700	\N	\N	f
2425	Sonora	26	144	27.66666700	-109.93333300	\N	\N	f
2426	Tlaxcala	29	144	19.13333300	-98.15000000	\N	\N	f
2427	Chiapas	05	144	16.80000000	-92.16666700	\N	\N	f
2428	Coahuila de Zaragoza	07	144	27.20000000	-101.40000000	\N	\N	f
2429	Durango	10	144	25.30000000	-104.66666700	\N	\N	f
2430	Guanajuato	11	144	20.45000000	-101.51666700	\N	\N	f
2431	Nuevo Leon	19	144	25.95000000	-100.40000000	\N	\N	f
2432	Oaxaca	20	144	16.98333300	-96.58333300	\N	\N	f
2433	Tabasco	27	144	17.65000000	-92.60000000	\N	\N	f
2434	Tamaulipas	28	144	24.06666700	-98.36666700	\N	\N	f
2435	Guerrero	12	144	18.06666700	-101.56666700	\N	\N	f
2436	Baja California	02	144	29.80000000	-115.48333300	\N	\N	f
2437	Campeche	04	144	18.71666700	-90.90000000	\N	\N	f
2438	Nayarit	18	144	22.20583300	-105.29277800	\N	\N	f
2439	Puebla	21	144	18.56944400	-98.40833300	\N	\N	f
2440	Sinaloa	25	144	25.71666700	-108.53333300	\N	\N	f
2441	Aguascalientes	01	144	22.35000000	-102.40000000	\N	\N	f
2442	San Luis Potosi	24	144	21.91666700	-99.30000000	\N	\N	f
2443	Zacatecas	32	144	23.18333300	-103.38333300	\N	\N	f
2444	Mexico	15	144	19.27694400	-99.77555600	\N	\N	f
2445	Jalisco	14	144	21.13333300	-102.50000000	\N	\N	f
2446	Hidalgo	13	144	20.96666700	-98.60000000	\N	\N	f
2447	Morelos	17	144	18.70000000	-99.16666700	\N	\N	f
2448	Colima	08	144	19.13333300	-103.70000000	\N	\N	f
2449	Queretaro de Arteaga	22	144	21.21666700	-99.18333300	\N	\N	f
2450	Baja California Sur	03	144	24.96666700	-111.21666700	\N	\N	f
2451	Distrito Federal	09	144	19.33333300	-99.31666700	\N	\N	f
2452	Sarawak	11	145	1.43333330	110.31666670	\N	\N	f
2453	Sabah	16	145	5.68333330	118.38333330	\N	\N	f
2454	Melaka	04	145	2.40000000	102.50000000	\N	\N	f
2455	Perlis	08	145	6.48333330	100.20000000	\N	\N	f
2456	Negeri Sembilan	05	145	2.85000000	102.51666670	\N	\N	f
2457	Kedah	02	145	6.41666670	99.83333330	\N	\N	f
2458	Johor	01	145	1.91666670	103.18333330	\N	\N	f
2459	Perak	07	145	4.18333330	101.15000000	\N	\N	f
2460	Pulau Pinang	09	145	5.45000000	100.36666670	\N	\N	f
2461	Terengganu	13	145	5.08333330	103.08333330	\N	\N	f
2462	Kelantan	03	145	5.76666670	102.46666670	\N	\N	f
2463	Pahang	06	145	3.90000000	103.08333330	\N	\N	f
2464	Kuala Lumpur	14	145	3.15000000	101.76666670	\N	\N	f
2465	Selangor	12	145	3.31666670	101.46666670	\N	\N	f
2466	Labuan	15	145	5.33333330	115.21666670	\N	\N	f
2467	Maputo	04	146	-25.90027780	32.55555560	\N	\N	f
2468	Nampula	06	146	-15.14388890	39.70527780	\N	\N	f
2469	Zambezia	09	146	-17.17805560	37.83333330	\N	\N	f
2470	Niassa	07	146	-12.18750000	34.70750000	\N	\N	f
2471	Cabo Delgado	01	146	-11.42666670	39.71777780	\N	\N	f
2472	Gaza	02	146	-24.46888890	33.15194440	\N	\N	f
2473	Inhambane	03	146	-24.26305560	35.06750000	\N	\N	f
2474	Manica	10	146	-20.39972220	33.23000000	\N	\N	f
2475	Tete	08	146	-14.83833330	34.20194440	\N	\N	f
2476	Sofala	05	146	-18.21527780	35.86472220	\N	\N	f
2478	Hardap	30	147	-23.96666670	16.08333330	\N	\N	f
2479	Otjozondjupa	39	147	-19.28333330	18.08333330	\N	\N	f
2481	Karas	31	147	-28.08333330	15.81666670	\N	\N	f
2482	Omusati	36	147	-18.11666670	14.80000000	\N	\N	f
2483	Oshana	37	147	-17.85000000	15.78333330	\N	\N	f
2484	Kunene	32	147	-18.10000000	14.33333330	\N	\N	f
2485	Erongo	29	147	-21.11666670	15.06666670	\N	\N	f
2486	Oshikoto	38	147	-18.31666670	16.28333330	\N	\N	f
2487	Omaheke	35	147	-23.63333330	19.36666670	\N	\N	f
2488	Caprivi	28	147	-18.06666670	21.45000000	\N	\N	f
2489	Okavango	34	147	-18.13333330	20.88333330	\N	\N	f
2490	Ohangwena	33	147	-17.41666670	16.00000000	\N	\N	f
2491	Windhoek	21	147	-22.57000000	17.08361110	\N	\N	f
2493	Niamey	05	149	13.38277780	2.20861110	\N	\N	f
2494	Diffa	02	149	13.63333330	13.25000000	\N	\N	f
2496	Tahoua	06	149	15.45222220	6.27833330	\N	\N	f
2497	Agadez	01	149	17.51666670	8.65000000	\N	\N	f
2498	Zinder	07	149	14.80000000	8.08333330	\N	\N	f
2499	Dosso	03	149	13.05000000	3.56666670	\N	\N	f
2500	Maradi	04	149	14.15000000	8.21666670	\N	\N	f
2501	Niamey	08	149	13.51666670	2.11666670	\N	\N	f
2504	Benue	26	151	7.06666670	8.93333330	\N	\N	f
2505	Nassarawa	56	151	7.16666670	8.50000000	\N	\N	f
2506	Kaduna	23	151	11.00000000	7.76666670	\N	\N	f
2507	Oyo	32	151	7.70000000	3.56666670	\N	\N	f
2508	Adamawa	35	151	8.50000000	12.28333330	\N	\N	f
2509	Osun	42	151	7.71666670	4.50000000	\N	\N	f
2510	Borno	27	151	13.61666670	13.26666670	\N	\N	f
2511	Bauchi	46	151	10.38333330	8.70000000	\N	\N	f
2513	Ogun	16	151	6.68333330	3.51666670	\N	\N	f
2514	Anambra	25	151	6.18333330	6.98333330	\N	\N	f
2515	Yobe	44	151	11.78333330	11.23333330	\N	\N	f
2516	Lagos	05	151	6.40833330	3.38222220	\N	\N	f
2517	Delta	36	151	6.06666670	6.48333330	\N	\N	f
2518	Enugu	47	151	6.36666670	7.30000000	\N	\N	f
2519	Federal Capital Territory	11	151	8.46666670	6.95000000	\N	\N	f
2520	Kogi	41	151	7.81666670	7.53333330	\N	\N	f
2521	Taraba	43	151	8.86666670	11.35000000	\N	\N	f
2522	Akwa Ibom	21	151	4.98333330	7.78333330	\N	\N	f
2523	Ebonyi	53	151	6.33333330	8.10000000	\N	\N	f
2525	Imo	28	151	5.43333330	7.10000000	\N	\N	f
2526	Jigawa	39	151	11.88333330	9.66666670	\N	\N	f
2528	Kwara	30	151	8.41666670	4.58333330	\N	\N	f
2529	Abia	45	151	5.40000000	7.36666670	\N	\N	f
2530	Gombe	55	151	9.73333330	10.95000000	\N	\N	f
2531	Cross River	22	151	5.10000000	8.48333330	\N	\N	f
2532	Katsina	24	151	13.16666670	7.78333330	\N	\N	f
2533	Sokoto	51	151	13.40000000	5.23333330	\N	\N	f
2534	Niger	31	151	9.55000000	7.01666670	\N	\N	f
2535	Zamfara	57	151	12.03333330	6.95000000	\N	\N	f
2536	Edo	37	151	6.00000000	5.31666670	\N	\N	f
2538	Kano	29	151	11.10000000	8.10000000	\N	\N	f
2539	Kebbi	40	151	11.98333330	4.30000000	\N	\N	f
2540	Ekiti	54	151	7.63333330	5.21666670	\N	\N	f
2541	Bayelsa	52	151	4.84638890	6.26805560	\N	\N	f
2542	Plateau	49	151	9.40000000	8.96666670	\N	\N	f
2543	Ondo	48	151	7.25000000	5.20000000	\N	\N	f
2544	Rivers	50	151	4.56666670	7.15000000	\N	\N	f
2547	Leon	08	152	12.66666670	-86.28333330	\N	\N	f
2548	Chontales	04	152	11.96666670	-85.16666670	\N	\N	f
2549	Managua	10	152	12.03333330	-86.46666670	\N	\N	f
2550	Autonoma Atlantico Norte	17	152	14.98333330	-83.16666670	\N	\N	f
2551	Granada	06	152	11.78333330	-85.96666670	\N	\N	f
2552	Matagalpa	12	152	13.05000000	-85.70000000	\N	\N	f
2553	Boaco	01	152	12.38333330	-85.78333330	\N	\N	f
2554	Carazo	02	152	11.81666670	-86.20000000	\N	\N	f
2555	Chinandega	03	152	12.63333330	-86.90000000	\N	\N	f
2556	Rio San Juan	14	152	11.68333330	-84.70000000	\N	\N	f
2557	Rivas	15	152	11.56666670	-85.58333330	\N	\N	f
2558	Masaya	11	152	12.06666670	-86.10000000	\N	\N	f
2559	Jinotega	07	152	14.25000000	-85.11666670	\N	\N	f
2560	Nueva Segovia	13	152	13.63333330	-86.63333330	\N	\N	f
2561	Region Autonoma Atlantico Sur	18	152	11.20000000	-83.85000000	\N	\N	f
2562	Madriz	09	152	13.56666670	-86.35000000	\N	\N	f
2563	Esteli	05	152	13.05000000	-86.25000000	\N	\N	f
2564	Drenthe	01	153	52.95000000	6.96666670	\N	\N	f
2565	Zuid-Holland	11	153	51.85000000	4.20000000	\N	\N	f
2566	Overijssel	15	153	52.36666670	6.63333330	\N	\N	f
2567	Noord-Holland	07	153	52.68333330	4.70000000	\N	\N	f
2568	Zeeland	10	153	51.55000000	3.51666670	\N	\N	f
2569	Limburg	05	153	51.58333330	6.05000000	\N	\N	f
2570	Noord-Brabant	06	153	51.75000000	5.13333330	\N	\N	f
2571	Gelderland	03	153	51.78333330	5.13333330	\N	\N	f
2572	Friesland	02	153	53.33333330	6.00000000	\N	\N	f
2573	Groningen	04	153	53.30000000	6.36666670	\N	\N	f
2574	Utrecht	09	153	52.16666670	4.90000000	\N	\N	f
2575	Flevoland	16	153	52.36666670	5.15000000	\N	\N	f
2576	Nordland	09	154	63.96666700	10.21666700	\N	\N	f
2577	Sor-Trondelag	16	154	63.96666700	10.20000000	\N	\N	f
2578	Troms	18	154	68.78333300	17.76666700	\N	\N	f
2579	Vestfold	20	154	59.16666700	10.21666700	\N	\N	f
2580	Hedmark	06	154	60.78333300	11.30000000	\N	\N	f
2581	Hordaland	07	154	60.36666700	5.48333300	\N	\N	f
2582	Vest-Agder	19	154	59.01666700	6.93333300	\N	\N	f
2583	More og Romsdal	08	154	62.66666700	7.51666700	\N	\N	f
2584	Telemark	17	154	59.20000000	9.53333300	\N	\N	f
2585	Buskerud	04	154	60.55000000	8.26666700	\N	\N	f
2586	Rogaland	14	154	59.26666700	5.18333300	\N	\N	f
2587	Aust-Agder	02	154	58.66805600	9.18416700	\N	\N	f
2588	Oppland	11	154	60.35000000	10.58333300	\N	\N	f
2589	Sogn og Fjordane	15	154	61.46666700	5.41666700	\N	\N	f
2590	Akershus	01	154	59.85000000	11.66666700	\N	\N	f
2591	Nord-Trondelag	10	154	64.43333300	13.46666700	\N	\N	f
2592	Ostfold	13	154	59.26666700	11.11666700	\N	\N	f
2593	Finnmark	05	154	70.16666700	28.78333300	\N	\N	f
2594	Oslo	12	154	59.88388900	10.77750000	\N	\N	f
2598	Wellington	G2	158	-45.88333300	170.41666700	\N	\N	f
2599	West Coast	G3	158	-46.11666700	169.83333300	\N	\N	f
2600	Canterbury	E9	158	-43.55000000	172.61666700	\N	\N	f
2601	Otago	F7	158	-40.95000000	173.91666700	\N	\N	f
2602	Auckland	E7	158	-35.78333300	173.73333300	\N	\N	f
2603	Gisborne	F1	158	-38.43333300	178.05000000	\N	\N	f
2604	Hawkes Bay	F2	158	-39.48333300	176.90000000	\N	\N	f
2605	Taranaki	F9	158	-39.16666700	174.13333300	\N	\N	f
2606	Marlborough	F4	158	-41.73333300	173.86666700	\N	\N	f
2607	Nelson	F5	158	-40.71666700	172.60000000	\N	\N	f
2608	Waikato	G1	158	-37.91666700	174.80000000	\N	\N	f
2609	Southland	F8	158	-46.08333300	168.05000000	\N	\N	f
2611	Bay of Plenty	E8	158	-37.70000000	176.11666700	\N	\N	f
2613	Manawatu-Wanganui	F3	158	-38.61666700	175.31666700	\N	\N	f
2614	Al Batinah	02	159	24.26666670	56.15000000	\N	\N	f
2615	Az Zahirah	05	159	24.43333330	56.05000000	\N	\N	f
2616	Ash Sharqiyah	04	159	22.55055560	59.32805560	\N	\N	f
2617	Masqat	06	159	23.17527780	58.81416670	\N	\N	f
2618	Musandam	07	159	26.17416670	56.27638890	\N	\N	f
2619	Zufar	08	159	17.40000000	53.91666670	\N	\N	f
2621	Los Santos	07	160	7.50000000	-80.56666670	\N	\N	f
2622	Darien	05	160	7.63444440	-78.18194440	\N	\N	f
2623	Chiriqui	02	160	8.58333330	-82.41666670	\N	\N	f
2624	Colon	04	160	9.22277780	-80.01916670	\N	\N	f
2625	Veraguas	10	160	8.55000000	-80.93333330	\N	\N	f
2626	San Blas	09	160	9.50000000	-78.95000000	\N	\N	f
2627	Bocas del Toro	01	160	9.15000000	-82.31666670	\N	\N	f
2628	Herrera	06	160	7.88333330	-80.91666670	\N	\N	f
2629	Panama	08	160	9.16666670	-79.61666670	\N	\N	f
2630	Cocle	03	160	8.48333330	-80.65000000	\N	\N	f
2631	Ancash	02	161	-9.11666670	-78.55000000	\N	\N	f
2632	Apurimac	03	161	-13.63388890	-72.88138890	\N	\N	f
2633	Arequipa	04	161	-15.43055560	-73.49750000	\N	\N	f
2634	Ica	11	161	-13.98333330	-75.70000000	\N	\N	f
2635	Cusco	08	161	-13.45000000	-72.36666670	\N	\N	f
2636	Lambayeque	14	161	-6.36666670	-79.81666670	\N	\N	f
2637	Ucayali	25	161	-8.18333330	-73.76666670	\N	\N	f
2638	La Libertad	13	161	-8.31666670	-78.18333330	\N	\N	f
2639	Ayacucho	05	161	-13.11944440	-73.95027780	\N	\N	f
2640	Lima	15	161	-12.28333330	-76.20000000	\N	\N	f
2641	Puno	21	161	-15.40000000	-69.33333330	\N	\N	f
2642	Junin	12	161	-11.02611110	-75.75777780	\N	\N	f
2643	Tumbes	24	161	-3.74361110	-80.77777780	\N	\N	f
2644	Tacna	23	161	-17.31666670	-69.71666670	\N	\N	f
2645	Cajamarca	06	161	-7.30000000	-78.03333330	\N	\N	f
2646	Huancavelica	09	161	-13.88333330	-75.18333330	\N	\N	f
2647	Moquegua	18	161	-16.71666670	-70.35000000	\N	\N	f
2648	Amazonas	01	161	-5.58972220	-78.47416670	\N	\N	f
2649	Huanuco	10	161	-10.03666670	-76.46638890	\N	\N	f
2650	San Martin	22	161	-6.41666670	-75.90000000	\N	\N	f
2651	Piura	20	161	-5.69750000	-79.66361110	\N	\N	f
2652	Loreto	16	161	-5.45055560	-75.81555560	\N	\N	f
2653	Pasco	19	161	-10.45111110	-76.18611110	\N	\N	f
2654	Madre de Dios	17	161	-12.25000000	-69.23333330	\N	\N	f
2655	Callao	07	161	-12.08333330	-77.21666670	\N	\N	f
2657	Eastern Highlands	09	163	-6.28333330	145.63333330	\N	\N	f
2658	Madang	12	163	-4.48333330	145.26666670	\N	\N	f
2659	Milne Bay	03	163	-10.20000000	149.83333330	\N	\N	f
2660	Western	06	163	-8.93333330	143.16666670	\N	\N	f
2661	Central	01	163	-9.47250000	147.89250000	\N	\N	f
2662	Sandaun	18	163	-3.90000000	141.20000000	\N	\N	f
2663	East Sepik	11	163	-3.70000000	143.43333330	\N	\N	f
2664	West New Britain	17	163	-6.31666670	150.05000000	\N	\N	f
2665	Southern Highlands	05	163	-6.35000000	143.73333330	\N	\N	f
2666	Northern	04	163	-9.00000000	147.75000000	\N	\N	f
2667	Gulf	02	163	-7.90000000	145.68333330	\N	\N	f
2668	Western Highlands	16	163	-5.65000000	144.13333330	\N	\N	f
2669	Morobe	14	163	-6.41666670	147.55000000	\N	\N	f
2670	Chimbu	08	163	-5.96666670	144.86666670	\N	\N	f
2671	East New Britain	10	163	-4.81666670	151.70000000	\N	\N	f
2672	North Solomons	07	163	-6.73333330	155.32500000	\N	\N	f
2673	Enga	19	163	-5.40000000	143.90000000	\N	\N	f
2674	Manus	13	163	-2.03333330	146.61666670	\N	\N	f
2675	New Ireland	15	163	-3.05000000	151.65000000	\N	\N	f
2676	National Capital	20	163	-9.48333330	147.16666670	\N	\N	f
2677	Pangasinan	51	164	15.76666700	120.41666700	\N	\N	f
2678	Cebu	21	164	10.73333300	123.95000000	\N	\N	f
2679	Samar	55	164	11.56944400	125.03277800	\N	\N	f
2680	Camarines Sur	16	164	13.66666700	123.06666700	\N	\N	f
2681	Iloilo	30	164	10.95000000	122.56666700	\N	\N	f
2682	Ilocos Norte	28	164	18.15694400	120.69583300	\N	\N	f
2683	Antique	06	164	10.49611100	121.96194400	\N	\N	f
2684	Bohol	11	164	9.91638900	124.49944400	\N	\N	f
2685	Cagayan	14	164	17.57722200	121.83055600	\N	\N	f
2686	Eastern Samar	23	164	11.66666700	125.08333300	\N	\N	f
2687	Davao	24	164	7.50666700	125.72666700	\N	\N	f
2688	Leyte	37	164	11.08694400	124.91777800	\N	\N	f
2689	Masbate	39	164	12.05000000	123.95000000	\N	\N	f
2690	Negros Occidental	45	164	10.55000000	123.40000000	\N	\N	f
2691	Nueva Vizcaya	48	164	16.00944400	121.20833300	\N	\N	f
2692	Romblon	54	164	12.55000000	122.11666700	\N	\N	f
2693	South Cotabato	70	164	6.06527800	124.46611100	\N	\N	f
2694	Ilocos Sur	29	164	17.03333300	120.56666700	\N	\N	f
2695	Quezon	H2	164	14.63000000	121.93777800	\N	\N	f
2696	Lanao del Norte	34	164	7.93840000	123.77240000	\N	\N	f
2697	North Cotabato	57	164	7.16666700	124.81666700	\N	\N	f
2698	Surigao del Sur	62	164	8.94027800	125.99583300	\N	\N	f
2699	Iligan	C8	164	8.14055600	124.22000000	\N	\N	f
2700	Southern Leyte	59	164	10.17777800	124.98861100	\N	\N	f
2701	Tarlac	63	164	15.61027800	120.60833300	\N	\N	f
2702	Bukidnon	12	164	7.97111100	125.32444400	\N	\N	f
2703	Mindoro Occidental	40	164	13.51666700	120.43333300	\N	\N	f
2704	Palawan	49	164	12.31194400	119.92305600	\N	\N	f
2705	Abra	01	164	17.51666700	120.73333300	\N	\N	f
2706	Bulacan	13	164	14.77222200	120.94000000	\N	\N	f
2707	Capiz	18	164	11.26666700	122.48333300	\N	\N	f
2708	Nueva Ecija	47	164	15.78611100	120.97305600	\N	\N	f
2709	Sorsogon	58	164	12.96277800	123.66805600	\N	\N	f
2710	Benguet	10	164	16.80527800	120.83000000	\N	\N	f
2711	Northern Samar	67	164	12.47888900	125.04277800	\N	\N	f
2712	Quirino	68	164	16.27305600	121.65833300	\N	\N	f
2713	Isabela	31	164	16.98166700	122.05611100	\N	\N	f
2714	Kalinga-Apayao	32	164	18.11666700	121.06666700	\N	\N	f
2715	Mountain	44	164	17.68333300	121.41666700	\N	\N	f
2716	Albay	05	164	13.11666700	123.41666700	\N	\N	f
2717	Batangas	09	164	13.92194400	120.95916700	\N	\N	f
2718	Catanduanes	19	164	13.66666700	124.35000000	\N	\N	f
2719	Negros Oriental	46	164	9.58722200	123.07750000	\N	\N	f
2720	Ifugao	27	164	16.84638900	121.21416700	\N	\N	f
2721	Misamis Oriental	43	164	8.51027800	124.46944400	\N	\N	f
2722	Laguna	33	164	14.11666700	121.43333300	\N	\N	f
2723	Zamboanga del Sur	66	164	7.43450000	123.39650000	\N	\N	f
2724	Camiguin	17	164	9.23333300	124.70000000	\N	\N	f
2725	Negros Occidental	H3	164	10.52583300	122.99250000	\N	\N	f
2726	Bataan	07	164	14.72222200	120.53833300	\N	\N	f
2727	Lanao del Sur	35	164	7.46666700	124.13333300	\N	\N	f
2728	Basilan	22	164	6.48694400	121.91361100	\N	\N	f
2729	La Union	36	164	16.65000000	120.35000000	\N	\N	f
2730	Camarines Norte	15	164	14.16666700	122.70000000	\N	\N	f
2731	Caloocan	B4	164	14.67527800	120.96805600	\N	\N	f
2732	Legaspi	D5	164	13.16666700	123.71666700	\N	\N	f
2733	Calbayog	B3	164	12.10138900	124.55916700	\N	\N	f
2734	Agusan del Norte	02	164	8.99138900	125.31194400	\N	\N	f
2735	Pampanga	50	164	15.12555600	120.64361100	\N	\N	f
2736	Mindoro Oriental	41	164	12.70000000	121.36666700	\N	\N	f
2738	Sulu	60	164	5.99222200	121.00972200	\N	\N	f
2739	Cebu City	B7	164	10.44388900	123.87194400	\N	\N	f
2740	Roxas	F3	164	11.50527800	122.76250000	\N	\N	f
2741	Misamis Occidental	42	164	8.32350000	123.83080000	\N	\N	f
2742	Aklan	04	164	11.78333300	122.25000000	\N	\N	f
2743	Maguindanao	56	164	7.06666700	124.66666700	\N	\N	f
2744	Dumaguete	C5	164	9.33111100	123.30888900	\N	\N	f
2745	Surigao del Norte	61	164	9.66666700	125.40000000	\N	\N	f
2746	Ormoc	E4	164	11.08333300	124.45000000	\N	\N	f
2747	Davao del Sur	25	164	6.48888900	125.58722200	\N	\N	f
2748	Zambales	64	164	14.99555600	120.28000000	\N	\N	f
2749	Agusan del Sur	03	164	8.55361100	125.71083300	\N	\N	f
2751	Lapu-Lapu	D4	164	10.27750000	123.98416700	\N	\N	f
2752	Marinduque	38	164	13.45000000	121.83333300	\N	\N	f
2753	Rizal	53	164	14.60805600	121.08000000	\N	\N	f
2754	Butuan	A8	164	8.97472200	125.52361100	\N	\N	f
2755	Cagayan de Oro	B2	164	8.49055600	124.73722200	\N	\N	f
2756	Pasay	E9	164	14.52580000	121.01610000	\N	\N	f
2757	Sultan Kudarat	71	164	6.26500000	124.16916700	\N	\N	f
2758	Davao City	C3	164	7.06416700	125.46861100	\N	\N	f
2759	Cavite	20	164	14.42194400	120.91611100	\N	\N	f
2760	Iloilo City	C9	164	10.68333300	122.50000000	\N	\N	f
2761	Silay	F8	164	10.78333300	123.05000000	\N	\N	f
2762	Pagadian	E7	164	7.89780000	123.42260000	\N	\N	f
2763	Trece Martires	G6	164	14.28333300	120.88333300	\N	\N	f
2764	Quezon City	F2	164	14.66500000	121.02080000	\N	\N	f
2765	Siquijor	69	164	9.28416700	123.64000000	\N	\N	f
2766	Cotabato	B8	164	7.16750000	124.25388900	\N	\N	f
2767	Angeles	A1	164	15.15527800	120.57055600	\N	\N	f
2768	Toledo	G5	164	10.31000000	123.63916700	\N	\N	f
2769	San Carlos	F4	164	10.48333300	123.39750000	\N	\N	f
2770	Lipa	D6	164	14.00000000	121.08333300	\N	\N	f
2771	Davao Oriental	26	164	7.19888900	126.43750000	\N	\N	f
2772	Tacloban	G1	164	11.25888900	124.98694400	\N	\N	f
2773	Tawitawi	72	164	7.03333300	118.46666700	\N	\N	f
2775	Zamboanga del Norte	65	164	7.46000000	122.07777800	\N	\N	f
2776	Zamboanga	G7	164	6.95960000	121.94820000	\N	\N	f
2777	Bacolod	A2	164	10.66611100	122.95000000	\N	\N	f
2778	Marawi	E1	164	7.98944400	124.28166700	\N	\N	f
2779	Aurora	G8	164	15.73638900	121.50944400	\N	\N	f
2780	Ozamis	E6	164	8.10020000	123.75390000	\N	\N	f
2781	Danao	C1	164	10.50000000	123.98333300	\N	\N	f
2782	Bago	A3	164	10.53777800	122.83333300	\N	\N	f
2783	Cabanatuan	A9	164	15.47277800	121.02361100	\N	\N	f
2785	Baguio	A4	164	16.41638900	120.59305600	\N	\N	f
2786	Tangub	G4	164	8.03880000	123.65560000	\N	\N	f
2787	Naga	E2	164	13.61666700	123.16666700	\N	\N	f
2788	Olongapo	E3	164	14.83333300	120.28333300	\N	\N	f
2789	San Pablo	F7	164	13.98527800	121.31500000	\N	\N	f
2790	Oroquieta	E5	164	8.46680000	123.80300000	\N	\N	f
2791	Manila	D9	164	14.60850000	121.00610000	\N	\N	f
2792	San Juan	M6	164	14.60830000	121.02870000	\N	\N	f
2793	General Santos	C6	164	6.10333300	125.22055600	\N	\N	f
2794	Dapitan	C2	164	8.72020000	123.42170000	\N	\N	f
2795	Canlaon	B5	164	10.33555600	123.21305600	\N	\N	f
2796	Dagupan	B9	164	16.05000000	120.33333300	\N	\N	f
2798	Batanes	08	164	20.45000000	121.96972200	\N	\N	f
2799	Batangas City	A7	164	13.75944400	121.06000000	\N	\N	f
2800	Dipolog	C4	164	8.57550000	123.37210000	\N	\N	f
2802	Tagbilaran	G3	164	9.63333300	123.88333300	\N	\N	f
2803	Cadiz	B1	164	10.95000000	123.31666700	\N	\N	f
2804	Mandaue	D8	164	10.32472200	123.94944400	\N	\N	f
2805	Cavite City	B6	164	14.48805600	120.89527800	\N	\N	f
2806	Tagaytay	G2	164	14.09055600	120.90861100	\N	\N	f
2807	Gingoog	C7	164	8.82777800	125.09972200	\N	\N	f
2808	Iriga	D1	164	13.42500000	123.41777800	\N	\N	f
2809	Paranaque	L7	164	14.50530000	121.03110000	\N	\N	f
2811	La Carlota	D2	164	10.42333300	122.92083300	\N	\N	f
2812	Laoag	D3	164	18.19888900	120.59361100	\N	\N	f
2813	Lucena	D7	164	13.93138900	121.61722200	\N	\N	f
2814	Malaybalay	K6	164	8.15750000	125.12777800	\N	\N	f
2815	Palayan	E8	164	15.54138900	121.08611100	\N	\N	f
2816	Puerto Princesa	F1	164	9.73916700	118.73527800	\N	\N	f
2817	Surigao	F9	164	9.78388900	125.48888900	\N	\N	f
2818	Punjab	04	165	32.10000000	75.06666700	\N	\N	f
2819	Sindh	05	165	26.68750000	68.51944400	\N	\N	f
2820	Balochistan	02	165	29.65000000	66.40000000	\N	\N	f
2821	North-West Frontier	03	165	34.18888900	71.69194400	\N	\N	f
2822	Northern Areas	07	165	35.13333300	76.48333300	\N	\N	f
2823	Federally Administered Tribal Areas	01	165	32.56916700	69.84111100	\N	\N	f
2824	Azad Kashmir	06	165	32.88888900	74.19722200	\N	\N	f
2825	Islamabad	08	165	33.36944400	73.29722200	\N	\N	f
2833	Zachodniopomorskie	87	166	54.33333300	16.40000000	\N	\N	f
2835	Swietokrzyskie	84	166	50.41666700	20.21666700	\N	\N	f
2864	Lodzkie	74	166	51.81666700	19.30000000	\N	\N	f
2866	Warminsko-Mazurskie	85	166	53.78333300	20.48333300	\N	\N	f
2872	Malopolskie	77	166	50.06666700	19.53333300	\N	\N	f
2874	Mazowieckie	78	166	52.30000000	21.01666700	\N	\N	f
2876	Podlaskie	81	166	54.06666700	21.75000000	\N	\N	f
2880	Podkarpackie	80	166	49.93333300	21.91666700	\N	\N	f
2881	Lubuskie	76	166	52.16666700	15.81666700	\N	\N	f
2882	Dolnoslaskie	72	166	50.90694400	15.34166700	\N	\N	f
2883	Lubelskie	75	166	50.81666700	22.98333300	\N	\N	f
2884	Pomorskie	82	166	54.40000000	18.41666700	\N	\N	f
2885	Kujawsko-Pomorskie	73	166	52.86666700	17.96666700	\N	\N	f
2886	Wielkopolskie	86	166	52.16666700	18.18333300	\N	\N	f
2887	Slaskie	83	166	50.33333300	19.15000000	\N	\N	f
2888	Opolskie	79	166	50.50000000	18.41666700	\N	\N	f
2893	Braga	04	170	41.40000000	-8.26666670	\N	\N	f
2894	Vila Real	21	170	41.21666670	-7.70000000	\N	\N	f
2895	Santarem	18	170	39.76666670	-8.46666670	\N	\N	f
2896	Leiria	13	170	39.56666670	-8.93333330	\N	\N	f
2897	Lisboa	14	170	39.10000000	-9.20000000	\N	\N	f
2898	Braganca	05	170	41.55000000	-7.18333330	\N	\N	f
2899	Viana do Castelo	20	170	42.06666670	-8.41666670	\N	\N	f
2900	Portalegre	16	170	39.01666670	-7.13333330	\N	\N	f
2901	Setubal	19	170	38.73333330	-8.53333330	\N	\N	f
2902	Azores	23	170	38.56666670	-28.61666670	\N	\N	f
2903	Viseu	22	170	40.63333330	-7.70000000	\N	\N	f
2904	Porto	17	170	41.10000000	-8.01666670	\N	\N	f
2905	Aveiro	02	170	40.95000000	-8.35000000	\N	\N	f
2906	Castelo Branco	06	170	40.00000000	-7.90000000	\N	\N	f
2907	Faro	09	170	37.13333330	-7.60000000	\N	\N	f
2908	Coimbra	07	170	40.20000000	-8.28333330	\N	\N	f
2909	Madeira	10	170	32.71666670	-17.15000000	\N	\N	f
2910	Beja	03	170	37.65000000	-7.50000000	\N	\N	f
2911	Guarda	11	170	40.65000000	-7.30000000	\N	\N	f
2912	Evora	08	170	38.61666670	-7.61666670	\N	\N	f
2914	Cordillera	08	172	-25.08333330	-57.30000000	\N	\N	f
2915	Alto Parana	01	172	-25.81666670	-54.83333330	\N	\N	f
2916	Caazapa	05	172	-26.03333330	-55.93333330	\N	\N	f
2917	Boqueron	24	172	-21.93333330	-61.93333330	\N	\N	f
2918	Paraguari	15	172	-25.91666670	-57.15000000	\N	\N	f
2919	Amambay	02	172	-23.23333330	-55.85000000	\N	\N	f
2920	Alto Paraguay	23	172	-20.01666670	-59.76666670	\N	\N	f
2921	Canindeyu	19	172	-23.83333330	-55.48333330	\N	\N	f
2922	Concepcion	07	172	-22.91666670	-56.66666670	\N	\N	f
2923	Misiones	12	172	-26.83333330	-57.55000000	\N	\N	f
2924	Caaguazu	04	172	-25.41666670	-56.45000000	\N	\N	f
2925	Neembucu	13	172	-26.16666670	-58.15000000	\N	\N	f
2926	Itapua	11	172	-27.30000000	-55.71666670	\N	\N	f
2927	Central	06	172	-25.53333330	-57.61666670	\N	\N	f
2928	San Pedro	17	172	-24.13333330	-57.08333330	\N	\N	f
2929	Presidente Hayes	16	172	-23.43333330	-59.71666670	\N	\N	f
2930	Guaira	10	172	-25.73333330	-56.61666670	\N	\N	f
2931	Madinat ach Shamal	08	173	26.12361110	51.16916670	\N	\N	f
2932	Ad Dawhah	01	173	25.27833330	51.52555560	\N	\N	f
2933	Umm Salal	09	173	25.45916670	51.31666670	\N	\N	f
2934	Al Khawr	04	173	25.70833330	51.59166670	\N	\N	f
2935	Al Jumaliyah	03	173	25.29861110	51.00166670	\N	\N	f
2936	Al Wakrah Municipality	05	173	25.16777780	51.60694440	\N	\N	f
2938	Ilfov	43	175	44.46666700	26.03333300	\N	\N	f
2939	Giurgiu	42	175	44.29083300	26.05805600	\N	\N	f
2940	Bihor	05	175	46.98333300	21.98333300	\N	\N	f
2941	Caras-Severin	12	175	45.51666700	22.43333300	\N	\N	f
2942	Mehedinti	26	175	44.71250000	22.76583300	\N	\N	f
2943	Vaslui	38	175	46.20000000	28.01666700	\N	\N	f
2944	Tulcea	37	175	45.18333300	29.40000000	\N	\N	f
2945	Constanta	14	175	43.78333300	28.58333300	\N	\N	f
2946	Mures	27	175	46.75000000	24.70000000	\N	\N	f
2947	Harghita	20	175	46.25000000	25.43333300	\N	\N	f
2948	Alba	01	175	46.26666700	23.06666700	\N	\N	f
2949	Arad	02	175	46.23333300	23.05000000	\N	\N	f
2950	Hunedoara	21	175	45.90000000	22.53333300	\N	\N	f
2951	Satu Mare	32	175	47.53333300	22.78333300	\N	\N	f
2952	Sibiu	33	175	45.83333300	23.88333300	\N	\N	f
2953	Maramures	25	175	47.68333300	23.36666700	\N	\N	f
2954	Brasov	09	175	45.65000000	25.98333300	\N	\N	f
2955	Cluj	13	175	47.01666700	23.45000000	\N	\N	f
2956	Teleorman	35	175	44.00000000	25.26666700	\N	\N	f
2957	Dambovita	16	175	44.93333300	25.60000000	\N	\N	f
2958	Dolj	17	175	44.48333300	23.73333300	\N	\N	f
2959	Suceava	34	175	47.73333300	26.30000000	\N	\N	f
2960	Botosani	07	175	48.06666700	26.93333300	\N	\N	f
2961	Iasi	23	175	47.01666700	26.93333300	\N	\N	f
2962	Arges	03	175	44.76666700	24.46666700	\N	\N	f
2963	Buzau	11	175	45.40000000	26.55000000	\N	\N	f
2964	Timis	36	175	45.87222200	21.67555600	\N	\N	f
2965	Neamt	28	175	47.20000000	26.00000000	\N	\N	f
2966	Bacau	04	175	46.48333300	26.21666700	\N	\N	f
2967	Braila	08	175	44.83333300	28.06666700	\N	\N	f
2968	Salaj	31	175	47.16666700	23.05000000	\N	\N	f
2969	Covasna	15	175	46.05000000	25.55000000	\N	\N	f
2970	Bistrita-Nasaud	06	175	47.40000000	24.15000000	\N	\N	f
2971	Calarasi	41	175	44.40000000	26.50000000	\N	\N	f
2972	Gorj	19	175	45.03333300	23.60000000	\N	\N	f
2973	Ialomita	22	175	44.53333300	27.13333300	\N	\N	f
2974	Olt	29	175	44.70000000	24.45000000	\N	\N	f
2975	Valcea	39	175	45.21666700	24.66666700	\N	\N	f
2976	Prahova	30	175	44.95000000	26.20000000	\N	\N	f
2977	Vrancea	40	175	45.50000000	26.93333300	\N	\N	f
2978	Bucuresti	10	175	44.48333300	26.15000000	\N	\N	f
2979	Galati	18	175	45.45000000	28.05000000	\N	\N	f
2983	Moskva	47	176	54.81222220	38.20916670	\N	\N	f
2984	Karelia	28	176	65.08333330	30.45000000	\N	\N	f
2985	Sakha	63	176	60.73333330	131.60000000	\N	\N	f
2987	Altaisky krai	04	176	51.30000000	83.78333330	\N	\N	f
2988	Ivanovo	21	176	57.38333330	41.75000000	\N	\N	f
2989	Kostroma	37	176	58.36666670	44.71666670	\N	\N	f
2990	Nizhegorod	51	176	56.02722220	43.15777780	\N	\N	f
2991	Tver	77	176	57.05777780	34.44055560	\N	\N	f
2992	Vladimir	83	176	56.31666670	40.05000000	\N	\N	f
2993	Perm	58	176	60.06666670	56.28333330	\N	\N	f
2994	Adygeya	01	176	44.36666670	40.23333330	\N	\N	f
2995	Chita	14	176	49.73333330	117.81666670	\N	\N	f
2996	Taymyr	74	176	70.41666670	90.01666670	\N	\N	f
2997	Kemerovo	29	176	53.71666670	87.23333330	\N	\N	f
2998	Udmurt	80	176	57.97944440	52.66222220	\N	\N	f
2999	Khakass	31	176	53.71555560	91.42916670	\N	\N	f
3000	Vologda	85	176	59.30000000	37.65000000	\N	\N	f
3001	Omsk	54	176	57.26666670	72.28333330	\N	\N	f
3002	Orenburg	55	176	51.30916670	58.17861110	\N	\N	f
3003	Irkutsk	20	176	55.61666670	103.93333330	\N	\N	f
3004	Krasnoyarsk	39	176	56.57277780	93.68944440	\N	\N	f
3005	Sverdlovsk	71	176	57.25000000	61.80000000	\N	\N	f
3006	Tambovskaya oblast	72	176	52.13972220	41.16166670	\N	\N	f
3007	Arkhangelsk	06	176	61.58333330	39.05000000	\N	\N	f
3008	Novosibirsk	53	176	55.19388890	78.65555560	\N	\N	f
3009	Ryazan	62	176	54.26666670	39.60000000	\N	\N	f
3010	Tula	76	176	54.14722220	36.79000000	\N	\N	f
3011	Rostov	61	176	49.16805560	40.81138890	\N	\N	f
3012	Yaroslavl	88	176	57.71277780	40.16222220	\N	\N	f
3013	Tatarstan	73	176	55.93666670	52.05388890	\N	\N	f
3014	Tyumen	78	176	58.12861110	68.59444440	\N	\N	f
3015	Penza	57	176	53.06666670	44.10000000	\N	\N	f
3016	Saratov	67	176	52.46666670	46.06666670	\N	\N	f
3017	Chuvashia	16	176	54.95000000	47.23333330	\N	\N	f
3018	Komi	34	176	62.68944440	56.18666670	\N	\N	f
3019	Bryansk	10	176	52.67944440	33.17500000	\N	\N	f
3020	Samara	65	176	52.68805560	48.67750000	\N	\N	f
3022	Mariy-El	45	176	56.59916670	48.36666670	\N	\N	f
3023	Leningrad	42	176	59.90000000	34.93333330	\N	\N	f
3024	Kirov	33	176	57.23333330	49.31666670	\N	\N	f
3025	Gorno-Altay	03	176	50.45000000	85.08333330	\N	\N	f
3026	Dagestan	17	176	42.51666670	47.66666670	\N	\N	f
3027	Kabardin-Balkar	22	176	43.70055560	44.21333330	\N	\N	f
3028	Amur	05	176	52.03333330	129.45000000	\N	\N	f
3029	North Ossetia	68	176	42.66472220	44.17500000	\N	\N	f
3030	Karachay-Cherkess	27	176	44.37138890	41.64083330	\N	\N	f
3031	Krasnodar	38	176	43.61000000	39.82583330	\N	\N	f
3032	Lipetsk	43	176	52.37111110	40.19666670	\N	\N	f
3033	Smolensk	69	176	55.67166670	34.75611110	\N	\N	f
3034	Kaliningrad	23	176	54.42638890	20.93250000	\N	\N	f
3035	Bashkortostan	08	176	55.82583330	58.32166670	\N	\N	f
3036	Chelyabinsk	13	176	55.86861110	59.83333330	\N	\N	f
3037	Ulyanovsk	81	176	54.01666670	50.01666670	\N	\N	f
3038	Stavropol	70	176	44.72944440	45.11222220	\N	\N	f
3039	Kurgan	40	176	54.78333330	62.61666670	\N	\N	f
3040	Astrakhan	07	176	46.31666670	47.96666670	\N	\N	f
3041	Volgograd	84	176	48.08333330	44.18666670	\N	\N	f
3042	Kalmyk	24	176	47.06666670	44.61666670	\N	\N	f
3043	Kaluga	25	176	54.77666670	36.38833330	\N	\N	f
3044	Magadan	44	176	64.21666670	157.36666670	\N	\N	f
3045	Pskov	60	176	57.33333330	28.56666670	\N	\N	f
3046	Orel	56	176	53.14694440	35.82888890	\N	\N	f
3047	Primorye	59	176	43.25000000	131.71666670	\N	\N	f
3048	Belgorod	09	176	50.58305560	37.65555560	\N	\N	f
3049	Buryat	11	176	52.51666670	113.30000000	\N	\N	f
3050	Tomsk	75	176	57.96666670	83.05000000	\N	\N	f
3051	Murmansk	49	176	68.97500000	33.01666670	\N	\N	f
3053	Sakhalin	64	176	50.14500000	142.88388890	\N	\N	f
3054	Voronezh	86	176	51.18777780	41.01833330	\N	\N	f
3055	Novgorod	52	176	58.70000000	35.15000000	\N	\N	f
3056	Mordovia	46	176	53.91083330	42.99833330	\N	\N	f
3057	Kamchatka	26	176	56.06666670	158.80000000	\N	\N	f
3058	Khabarovsk	30	176	49.90000000	136.60000000	\N	\N	f
3059	Koryak	36	176	60.98333330	170.28333330	\N	\N	f
3060	Chukot	15	176	64.88333330	-174.66666670	\N	\N	f
3061	Khanty-Mansiy	32	176	60.45000000	76.06666670	\N	\N	f
3062	Kursk	41	176	52.06083330	36.79750000	\N	\N	f
3063	Aginsky Buryatsky AO	02	176	51.56666670	114.50000000	\N	\N	f
3064	Tuva	79	176	52.45416670	96.23305560	\N	\N	f
3065	Nenets	50	176	68.22166670	53.46916670	\N	\N	f
3066	Evenk	18	176	66.93333330	93.50000000	\N	\N	f
3067	Yevrey	89	176	48.85000000	131.21666670	\N	\N	f
3069	Yamal-Nenets	87	176	66.56055560	67.79750000	\N	\N	f
3070	Saint Petersburg City	66	176	59.73333330	30.33333330	\N	\N	f
3071	Moscow City	48	176	55.70000000	37.46666670	\N	\N	f
3072	Kigali	09	177	-1.88472220	30.06861110	\N	\N	f
3073	Butare	01	177	-2.59722220	29.73888890	\N	\N	f
3077	Kibungo	07	177	-2.18166670	30.53250000	\N	\N	f
3080	Gitarama	06	177	-2.01666670	29.88333330	\N	\N	f
3082	Makkah	14	178	19.60861110	41.97166670	\N	\N	f
3083	Ar Riyad	10	178	27.02722220	44.06944440	\N	\N	f
3084	Hail	13	178	27.05250000	40.94388890	\N	\N	f
3085	Al Hudud ash Shamaliyah	15	178	30.45944440	42.00944440	\N	\N	f
3086	Jizan	17	178	17.46666670	44.10000000	\N	\N	f
3087	Ash Sharqiyah	06	178	25.93555560	49.66833330	\N	\N	f
3088	Al Madinah	05	178	23.82472220	39.14250000	\N	\N	f
3089	Al Qasim	08	178	25.14694440	43.47972220	\N	\N	f
3090	Al Bahah	02	178	25.10722220	43.45777780	\N	\N	f
3091	Tabuk	19	178	27.15000000	35.78333330	\N	\N	f
3092	Al Jawf	20	178	30.06277780	40.11694440	\N	\N	f
3094	Makira	08	179	-9.05000000	161.20000000	\N	\N	f
3096	Beau Vallon	08	180	-4.71666670	55.48333330	\N	\N	f
3098	Bahr al Ghazal	32	181	9.15000000	28.45000000	\N	\N	f
3100	River Nile	53	181	17.31083330	34.48361110	\N	\N	f
3101	Darfur	33	181	14.33333330	22.55000000	\N	\N	f
3102	Kurdufan	34	181	12.66666670	31.40000000	\N	\N	f
3103	Al Wusta	27	181	11.06666670	34.55000000	\N	\N	f
3104	Ash Shamaliyah	30	181	19.51666670	30.48333330	\N	\N	f
3105	Ash Sharqiyah	31	181	14.33333330	35.88333330	\N	\N	f
3106	Al Istiwaiyah	28	181	5.08333330	30.58333330	\N	\N	f
3110	Al Khartum	29	181	16.31222220	32.68916670	\N	\N	f
3113	Northern Darfur	55	181	13.63333330	25.35000000	\N	\N	f
3119	Central Equatoria State	44	181	5.72472220	31.42916670	\N	\N	f
3120	Al Wahadah State	40	181	9.23333330	29.83333330	\N	\N	f
3121	Kassala	52	181	15.45583330	36.39888890	\N	\N	f
3124	Southern Kordofan	50	181	11.01666670	29.71666670	\N	\N	f
3126	Upper Nile	35	181	9.53694440	31.65611110	\N	\N	f
3127	Southern Darfur	49	181	12.05000000	24.88333330	\N	\N	f
3133	Vasternorrlands Lan	24	182	62.90000000	17.83333330	\N	\N	f
3134	Vastra Gotaland	28	182	58.26666670	11.85000000	\N	\N	f
3135	Norrbottens Lan	14	182	66.85000000	23.53333330	\N	\N	f
3136	Vasterbottens Lan	23	182	65.46666670	16.90000000	\N	\N	f
3137	Skane Lan	27	182	56.03333330	13.63333330	\N	\N	f
3138	Kalmar Lan	09	182	56.75000000	16.65000000	\N	\N	f
3139	Jamtlands Lan	07	182	63.03333330	14.36666670	\N	\N	f
3140	Kronobergs Lan	12	182	56.66666670	13.41666670	\N	\N	f
3141	Ostergotlands Lan	16	182	58.30000000	14.95000000	\N	\N	f
3142	Stockholms Lan	26	182	59.36944440	18.63333330	\N	\N	f
3143	Dalarnas Lan	10	182	60.15000000	14.80000000	\N	\N	f
3144	Blekinge Lan	02	182	56.38333330	14.73333330	\N	\N	f
3145	Gavleborgs Lan	03	182	61.60000000	14.66666670	\N	\N	f
3146	Sodermanlands Lan	18	182	58.66666670	16.75000000	\N	\N	f
3147	Vastmanlands Lan	25	182	59.65000000	16.66666670	\N	\N	f
3148	Varmlands Lan	22	182	60.78333330	12.66666670	\N	\N	f
3149	Hallands Lan	06	182	56.93333330	12.71666670	\N	\N	f
3150	Orebro Lan	15	182	59.71666670	15.13333330	\N	\N	f
3151	Uppsala Lan	21	182	59.63333330	17.45000000	\N	\N	f
3152	Jonkopings Lan	08	182	57.41666670	15.31666670	\N	\N	f
3153	Gotlands Lan	05	182	57.45000000	18.26666670	\N	\N	f
3156	Bohinj Commune	04	185	45.46916670	13.97083330	\N	\N	f
3157	Brezovica Commune	09	185	46.58666670	16.28027780	\N	\N	f
3160	Kosice	03	187	48.31666670	20.33333330	\N	\N	f
3161	Banska Bystrica	01	187	48.41666670	19.43333330	\N	\N	f
3162	Nitra	04	187	48.51666670	18.61666670	\N	\N	f
3163	Trnava	07	187	48.25000000	17.61666670	\N	\N	f
3164	Presov	05	187	49.05000000	20.45000000	\N	\N	f
3165	Zilina	08	187	48.93333330	18.80000000	\N	\N	f
3166	Bratislava	02	187	48.71666670	17.05000000	\N	\N	f
3167	Trencin	06	187	48.85000000	17.93333330	\N	\N	f
3169	Western Area	04	188	8.49250000	-13.28444440	\N	\N	f
3170	Northern	02	188	8.66388890	-13.18805560	\N	\N	f
3171	Eastern	01	188	8.18805560	-10.34611110	\N	\N	f
3172	Southern	03	188	8.10000000	-11.45000000	\N	\N	f
3173	Acquaviva	01	189	43.95000000	12.41666670	\N	\N	f
3174	Chiesanuova	02	189	43.91666670	12.41666670	\N	\N	f
3175	San Marino	07	189	43.93333330	12.45000000	\N	\N	f
3176	Serravalle	09	189	43.98333330	12.50000000	\N	\N	f
3177	Dakar	01	190	14.67944440	-17.44972220	\N	\N	f
3179	Diourbel	03	190	14.95000000	-16.33333330	\N	\N	f
3181	Kolda	11	190	13.33333330	-14.61666670	\N	\N	f
3182	Ziguinchor	12	190	13.00000000	-16.73333330	\N	\N	f
3183	Thies	07	190	14.36666670	-16.76666670	\N	\N	f
3184	Fatick	09	190	13.68333330	-16.41666670	\N	\N	f
3185	Kaolack	10	190	13.61666670	-15.66666670	\N	\N	f
3186	Tambacounda	05	190	14.43333330	-12.20000000	\N	\N	f
3187	Louga	13	190	15.61666670	-16.21666670	\N	\N	f
3188	Matam	15	190	15.66666670	-13.25000000	\N	\N	f
3189	Saint-Louis	14	190	16.01888890	-16.49527780	\N	\N	f
3191	Bay	04	191	2.65000000	44.01666670	\N	\N	f
3192	Shabeellaha Hoose	14	191	1.43333330	43.91666670	\N	\N	f
3193	Bakool	01	191	3.58333330	43.86666670	\N	\N	f
3194	Hiiraan	07	191	3.78333330	46.25000000	\N	\N	f
3195	Gedo	06	191	2.30000000	42.33333330	\N	\N	f
3196	Bari	03	191	11.44138890	49.55305560	\N	\N	f
3197	Galguduud	05	191	3.60000000	46.95000000	\N	\N	f
3198	Mudug	10	191	7.08333330	47.48333330	\N	\N	f
3199	Woqooyi Galbeed	16	191	9.60000000	43.88333330	\N	\N	f
3200	Jubbada Dhexe	08	191	2.08333330	42.51666670	\N	\N	f
3201	Shabeellaha Dhexe	13	191	2.88333330	45.45000000	\N	\N	f
3202	Jubbada Hoose	09	191	-0.03333330	42.60000000	\N	\N	f
3204	Nugaal	11	191	8.15000000	48.35000000	\N	\N	f
3205	Sanaag	12	191	9.56666670	47.75000000	\N	\N	f
3206	Banaadir	02	191	2.10000000	45.46666670	\N	\N	f
3208	Brokopondo	10	192	5.13333330	-54.98333330	\N	\N	f
3209	Sipaliwini	18	192	4.45000000	-55.36666670	\N	\N	f
3210	Marowijne	13	192	5.30000000	-54.23333330	\N	\N	f
3211	Para	15	192	5.50000000	-54.70000000	\N	\N	f
3212	Commewijne	11	192	5.90000000	-54.90000000	\N	\N	f
3213	Saramacca	17	192	5.86666670	-55.56666670	\N	\N	f
3214	Nickerie	14	192	5.83333330	-56.81666670	\N	\N	f
3215	Coronie	12	192	5.91666670	-56.40000000	\N	\N	f
3216	Wanica	19	192	5.70000000	-55.08333330	\N	\N	f
3217	Paramaribo	16	192	5.80000000	-55.20000000	\N	\N	f
3218	Sao Tome	02	193	0.23333330	6.70000000	\N	\N	f
3219	Principe	01	193	1.63333330	7.45000000	\N	\N	f
3220	Sonsonate	13	194	13.54833330	-89.66777780	\N	\N	f
3221	Morazan	08	194	13.75000000	-88.11666670	\N	\N	f
3222	San Vicente	12	194	13.48333330	-88.68333330	\N	\N	f
3223	La Union	07	194	13.16750000	-88.03138890	\N	\N	f
3224	San Salvador	10	194	13.98888890	-89.28805560	\N	\N	f
3225	Chalatenango	03	194	14.18333330	-89.23333330	\N	\N	f
3226	La Libertad	05	194	13.86916670	-89.25777780	\N	\N	f
3227	Cabanas	02	194	13.86666670	-88.60000000	\N	\N	f
3228	Cuscatlan	04	194	13.92777780	-89.04944440	\N	\N	f
3229	Usulutan	14	194	13.33333330	-88.58333330	\N	\N	f
3230	Ahuachapan	01	194	13.76666670	-89.98333330	\N	\N	f
3231	Santa Ana	11	194	13.95000000	-89.51666670	\N	\N	f
3232	San Miguel	09	194	13.47611110	-88.10611110	\N	\N	f
3233	La Paz	06	194	13.40000000	-88.80000000	\N	\N	f
3234	Al Hasakah	01	195	36.86666670	40.23333330	\N	\N	f
3235	Ar Raqqah	04	195	36.66666670	39.01666670	\N	\N	f
3236	Tartus	14	195	34.96666670	35.88333330	\N	\N	f
3237	Rif Dimashq	08	195	33.50000000	36.56666670	\N	\N	f
3238	Hims	11	195	34.58333330	37.00000000	\N	\N	f
3239	Idlib	12	195	35.45000000	37.11666670	\N	\N	f
3240	Hamah	10	195	35.41666670	37.11666670	\N	\N	f
3241	Halab	09	195	36.46666670	38.36666670	\N	\N	f
3242	Al Qunaytirah	03	195	32.76666670	35.81666670	\N	\N	f
3243	Dar	06	195	32.81666670	35.98333330	\N	\N	f
3244	As Suwayda	05	195	32.88333330	36.46666670	\N	\N	f
3245	Al Ladhiqiyah	02	195	35.85000000	35.88333330	\N	\N	f
3246	Dayr az Zawr	07	195	35.51666670	39.91666670	\N	\N	f
3247	Dimashq	13	195	33.46666670	36.33333330	\N	\N	f
3248	Lubombo	02	196	-26.83333330	32.13333330	\N	\N	f
3249	Hhohho	01	196	-26.10000000	31.56666670	\N	\N	f
3250	Manzini	03	196	-26.55000000	31.01666670	\N	\N	f
3251	Shiselweni	04	196	-27.16666670	31.26666670	\N	\N	f
3253	Ouaddai	12	198	12.36666670	22.28333330	\N	\N	f
3254	Biltine	02	198	14.31666670	21.71666670	\N	\N	f
3255	Batha	01	198	13.20000000	18.30000000	\N	\N	f
3256	Mayo-Kebbi	10	198	10.63333330	15.31666670	\N	\N	f
3257	Chari-Baguirmi	04	198	12.83333330	14.80000000	\N	\N	f
3258	Guera	05	198	12.33333330	19.35000000	\N	\N	f
3259	Salamat	13	198	11.53333330	19.08333330	\N	\N	f
3260	Kanem	06	198	13.81666670	15.53333330	\N	\N	f
3261	Logone Occidental	08	198	8.35000000	15.53333330	\N	\N	f
3262	Lac	07	198	13.30000000	15.71666670	\N	\N	f
3263	Borkou-Ennedi-Tibesti	03	198	21.24361110	17.43250000	\N	\N	f
3264	Tandjile	14	198	9.41666670	15.75000000	\N	\N	f
3265	Moyen-Chari	11	198	9.48333330	19.01666670	\N	\N	f
3266	Logone Oriental	09	198	8.15000000	15.73333330	\N	\N	f
3268	Plateaux	25	200	7.46666670	1.30000000	\N	\N	f
3281	Kara	23	200	9.93333330	1.01666670	\N	\N	f
3289	Savanes	26	200	10.40000000	0.41666670	\N	\N	f
3290	Centrale	22	200	9.13333330	1.15000000	\N	\N	f
3292	Maritime	24	200	6.13194440	1.22277780	\N	\N	f
3293	Trat	49	201	12.56666700	102.45000000	\N	\N	f
3294	Chiang Mai	02	201	19.68333300	99.16666700	\N	\N	f
3295	Nan	04	201	18.53333300	100.70000000	\N	\N	f
3296	Prachin Buri	45	201	13.88333300	101.21666700	\N	\N	f
3297	Krabi	63	201	7.80000000	98.98333300	\N	\N	f
3298	Sakon Nakhon	20	201	17.60000000	103.98333300	\N	\N	f
3299	Nakhon Phanom	73	201	17.70000000	104.21666700	\N	\N	f
3300	Amnat Charoen	77	201	15.85000000	104.63333300	\N	\N	f
3301	Samut Songkhram	54	201	13.41666700	99.95000000	\N	\N	f
3302	Nakhon Sawan	16	201	15.93416700	99.97888900	\N	\N	f
3303	Kanchanaburi	50	201	15.10000000	98.46666700	\N	\N	f
3304	Ubon Ratchathani	71	201	15.68333300	104.65000000	\N	\N	f
3305	Chumphon	58	201	9.95000000	99.06666700	\N	\N	f
3306	Chachoengsao	44	201	13.60000000	101.08333300	\N	\N	f
3307	Sa Kaeo	80	201	13.68333300	102.50000000	\N	\N	f
3308	Roi Et	25	201	15.85944400	103.85972200	\N	\N	f
3309	Narathiwat	31	201	6.61666700	101.65000000	\N	\N	f
3310	Pattani	69	201	6.51888900	101.65194400	\N	\N	f
3311	Chaiyaphum	26	201	15.49916700	101.68972200	\N	\N	f
3312	Kalasin	23	201	16.40000000	103.38333300	\N	\N	f
3313	Chon Buri	46	201	13.30000000	101.11666700	\N	\N	f
3314	Sukhothai	09	201	17.01527800	99.70777800	\N	\N	f
3315	Surat Thani	60	201	9.13333300	99.31666700	\N	\N	f
3317	Phra Nakhon Si Ayutthaya	36	201	14.41666700	100.46666700	\N	\N	f
3318	Nonthaburi	38	201	13.91666700	100.43333300	\N	\N	f
3319	Samut Prakan	42	201	13.56666700	100.83333300	\N	\N	f
3320	Ang Thong	35	201	14.58333300	100.45000000	\N	\N	f
3321	Krung Thep	40	201	13.75000000	100.48333300	\N	\N	f
3322	Phitsanulok	12	201	16.56666700	100.30000000	\N	\N	f
3323	Nakhon Pathom	53	201	14.01666700	100.16666700	\N	\N	f
3324	Phichit	13	201	16.03333300	100.38333300	\N	\N	f
3325	Ratchaburi	52	201	13.70000000	99.93333300	\N	\N	f
3326	Suphan Buri	51	201	14.40000000	100.16666700	\N	\N	f
3327	Sing Buri	33	201	14.88333300	100.31666700	\N	\N	f
3328	Prachuap Khiri Khan	57	201	11.11666700	99.45000000	\N	\N	f
3329	Lamphun	05	201	18.31472200	98.81750000	\N	\N	f
3330	Rayong	47	201	12.78333300	101.30000000	\N	\N	f
3331	Ubon Ratchathani	75	201	16.05000000	105.21666700	\N	\N	f
3332	Chai Nat	32	201	15.18333300	100.13333300	\N	\N	f
3333	Buriram	28	201	14.36666700	103.05000000	\N	\N	f
3334	Phetchaburi	56	201	13.21666700	99.98333300	\N	\N	f
3335	Tak	08	201	16.71666700	98.56666700	\N	\N	f
3336	Phayao	41	201	19.16666700	100.28333300	\N	\N	f
3337	Lop Buri	34	201	15.04361100	100.56611100	\N	\N	f
3338	Saraburi	37	201	14.61666700	100.73333300	\N	\N	f
3339	Nakhon Nayok	43	201	14.25916700	101.06833300	\N	\N	f
3340	Yala	70	201	6.26611100	101.26388900	\N	\N	f
3341	Nakhon Ratchasima	27	201	14.71666700	102.01666700	\N	\N	f
3342	Samut Sakhon	55	201	13.58333300	100.11666700	\N	\N	f
3343	Khon Kaen	22	201	16.06666700	102.73333300	\N	\N	f
3344	Uthai Thani	15	201	15.08250000	99.52111100	\N	\N	f
3345	Nong Khai	17	201	18.01666700	103.08333300	\N	\N	f
3346	Maha Sarakham	24	201	16.03333300	103.11666700	\N	\N	f
3347	Lampang	06	201	18.70222200	99.56638900	\N	\N	f
3348	Songkhla	68	201	6.86666700	100.71666700	\N	\N	f
3349	Nakhon Si Thammarat	64	201	7.95000000	99.98333300	\N	\N	f
3350	Loei	18	201	17.86666700	101.60000000	\N	\N	f
3351	Chiang Rai	03	201	20.28333300	100.40000000	\N	\N	f
3352	Surin	29	201	15.11472200	103.61388900	\N	\N	f
3353	Phetchabun	14	201	16.18333300	100.76666700	\N	\N	f
3354	Phrae	07	201	17.97944400	100.05333300	\N	\N	f
3355	Phangnga	61	201	8.51666700	98.63333300	\N	\N	f
3356	Uttaradit	10	201	17.90000000	100.78333300	\N	\N	f
3357	Sisaket	30	201	15.33333300	104.15000000	\N	\N	f
3358	Trang	65	201	7.75000000	99.61666700	\N	\N	f
3359	Kamphaeng Phet	11	201	16.20000000	99.71666700	\N	\N	f
3360	Phuket	62	201	7.86666700	98.26666700	\N	\N	f
3361	Mukdahan	78	201	16.55000000	104.33333300	\N	\N	f
3362	Yasothon	72	201	15.65000000	104.31666700	\N	\N	f
3363	Phatthalung	66	201	7.41666700	100.08333300	\N	\N	f
3364	Pathum Thani	39	201	14.06666700	100.65000000	\N	\N	f
3365	Chanthaburi	48	201	12.45000000	102.23333300	\N	\N	f
3366	Mae Hong Son	01	201	18.82888900	97.93416700	\N	\N	f
3367	Ranong	59	201	10.40000000	98.78333300	\N	\N	f
3368	Udon Thani	76	201	17.13361100	102.96750000	\N	\N	f
3369	Satun	67	201	6.86666700	99.71666700	\N	\N	f
3370	Nong Bua Lamphu	79	201	17.30750000	102.17944400	\N	\N	f
3371	Nakhon Phanom	21	201	17.63333300	104.13333300	\N	\N	f
3372	Khatlon	02	202	38.52861110	68.77972220	\N	\N	f
3373	Sughd	03	202	38.71666670	68.36666670	\N	\N	f
3374	Kuhistoni Badakhshon	01	202	38.48944440	73.87833330	\N	\N	f
3376	Lebap	04	204	38.10000000	64.85000000	\N	\N	f
3377	Balkan	02	204	37.41972220	54.15833330	\N	\N	f
3378	Ahal	01	204	37.30000000	60.58333330	\N	\N	f
3380	Mary	05	204	37.71666670	61.80000000	\N	\N	f
3381	Dashoguz	03	204	42.05000000	59.40000000	\N	\N	f
3382	Madanin	28	205	33.77750000	10.76944440	\N	\N	f
3383	El Kef	14	205	35.94472220	8.83250000	\N	\N	f
3384	Tozeur	35	205	33.90111110	8.13055560	\N	\N	f
3385	Sousse	23	205	36.15000000	10.25000000	\N	\N	f
3386	Gabes	29	205	33.88333330	10.11666670	\N	\N	f
3387	Sfax	32	205	35.03333330	10.96666670	\N	\N	f
3388	Bizerte	18	205	36.86666670	9.70000000	\N	\N	f
3389	Al Munastir	16	205	35.66666670	10.76666670	\N	\N	f
3390	Nabeul	19	205	36.76666670	10.73333330	\N	\N	f
3391	Kasserine	02	205	35.40000000	8.90000000	\N	\N	f
3392	Tataouine	34	205	32.86666670	10.28333330	\N	\N	f
3393	Sidi Bou Zid	33	205	35.06777780	9.78472220	\N	\N	f
3394	Al Mahdia	15	205	35.50472220	11.06222220	\N	\N	f
3395	Jendouba	06	205	36.63333330	8.56666670	\N	\N	f
3396	Ben Arous	27	205	36.63305560	10.28361110	\N	\N	f
3397	Kairouan	03	205	35.10166670	10.03305560	\N	\N	f
3398	Zaghouan	37	205	36.57472220	9.99138890	\N	\N	f
3399	Kebili	31	205	33.73333330	9.25000000	\N	\N	f
3400	Bajah	17	205	36.80000000	9.11666670	\N	\N	f
3402	Siliana	22	205	36.25000000	9.25000000	\N	\N	f
3404	Tunis	36	205	36.66555560	10.04750000	\N	\N	f
3405	Tongatapu	02	206	-21.13333330	-175.05000000	\N	\N	f
3406	Ha	01	206	-19.75000000	-174.31666670	\N	\N	f
3407	Vava	03	206	-15.56666670	-175.63333330	\N	\N	f
3408	Amasya	05	207	40.40000000	35.61666700	\N	\N	f
3409	Hatay	31	207	36.59027800	36.24555600	\N	\N	f
3410	Diyarbakir	21	207	38.43555600	40.30277800	\N	\N	f
3411	Adana	81	207	37.10000000	35.15000000	\N	\N	f
3412	Bolu	14	207	41.35000000	31.75000000	\N	\N	f
3413	Ankara	68	207	40.11483774	32.86300913	\N	\N	f
3414	Konya	71	207	38.21666700	32.55000000	\N	\N	f
3415	Bilecik	11	207	40.18333300	29.73333300	\N	\N	f
3416	Izmir	35	207	38.10722200	28.02111100	\N	\N	f
3417	Tokat	60	207	40.20000000	36.28333300	\N	\N	f
3418	Edirne	22	207	41.55000000	26.75000000	\N	\N	f
3419	Kirsehir	40	207	38.86194400	33.81083300	\N	\N	f
3420	Van	65	207	38.28333300	43.20000000	\N	\N	f
3421	Kastamonu	37	207	41.97583300	34.01138900	\N	\N	f
3422	Sivas	58	207	40.07861100	38.49694400	\N	\N	f
3423	Denizli	20	207	37.74527800	29.41722200	\N	\N	f
3424	Kutahya	43	207	39.23333300	29.48333300	\N	\N	f
3425	Bingol	12	207	38.78333300	40.90000000	\N	\N	f
3426	Kahramanmaras	46	207	38.18333300	36.78333300	\N	\N	f
3427	Sanliurfa	63	207	37.36666700	39.13333300	\N	\N	f
3428	Agri	04	207	39.81666700	43.60000000	\N	\N	f
3429	Eskisehir	26	207	39.40000000	31.08333300	\N	\N	f
3430	Malatya	44	207	38.93333300	38.35000000	\N	\N	f
3431	Adiyaman	02	207	37.70000000	37.45000000	\N	\N	f
3432	Giresun	28	207	40.95500000	38.11555600	\N	\N	f
3433	Mus	49	207	38.91666700	42.16666700	\N	\N	f
3434	Corum	19	207	40.40000000	34.68333300	\N	\N	f
3435	Erzurum	25	207	39.88333300	40.78333300	\N	\N	f
3436	Mersin	32	207	36.85000000	34.88333300	\N	\N	f
3437	Aydin	09	207	37.82444400	27.74666700	\N	\N	f
3438	Nevsehir	50	207	38.71666700	34.20000000	\N	\N	f
3439	Manisa	45	207	38.66666700	27.75000000	\N	\N	f
3440	Canakkale	17	207	40.20000000	27.25000000	\N	\N	f
3441	Ordu	52	207	40.56666700	37.63333300	\N	\N	f
3442	Yozgat	66	207	39.33333300	35.31666700	\N	\N	f
3443	Tunceli	62	207	38.76666700	39.48333300	\N	\N	f
3444	Mardin	72	207	37.13944400	40.48722200	\N	\N	f
3445	Sinop	57	207	41.91666700	34.75000000	\N	\N	f
3446	Antalya	07	207	36.99000000	30.93861100	\N	\N	f
3447	Erzincan	24	207	39.65000000	39.83333300	\N	\N	f
3448	Artvin	08	207	41.43861100	41.46222200	\N	\N	f
3449	Sakarya	54	207	41.26666700	41.16666700	\N	\N	f
3450	Afyonkarahisar	03	207	38.96666700	30.48333300	\N	\N	f
3451	Bursa	16	207	40.16666700	28.68333300	\N	\N	f
3452	Trabzon	61	207	40.40250000	40.24111100	\N	\N	f
3453	Tekirdag	59	207	40.91666700	27.20000000	\N	\N	f
3454	Kilis	90	207	36.74416700	37.19305600	\N	\N	f
3455	Gaziantep	83	207	36.86527800	37.37000000	\N	\N	f
3456	Sirnak	80	207	37.75138900	42.96416700	\N	\N	f
3457	Balikesir	10	207	39.64916700	27.88611100	\N	\N	f
3458	Elazig	23	207	38.45000000	39.55000000	\N	\N	f
3459	Ardahan	86	207	41.15000000	42.60000000	\N	\N	f
3460	Batman	76	207	37.61500000	41.14722200	\N	\N	f
3461	Kayseri	38	207	39.03333300	35.45000000	\N	\N	f
3462	Kocaeli	41	207	40.71666700	30.11666700	\N	\N	f
3463	Samsun	55	207	41.01666700	36.28333300	\N	\N	f
3464	Isparta	33	207	37.51666700	31.46666700	\N	\N	f
3465	Mugla	48	207	36.30527800	29.32250000	\N	\N	f
3466	Bitlis	13	207	38.63166700	42.47361100	\N	\N	f
3467	Rize	53	207	40.98333300	40.61666700	\N	\N	f
3468	Hakkari	70	207	37.52833300	44.17083300	\N	\N	f
3469	Istanbul	34	207	40.86777800	29.13305600	\N	\N	f
3470	Karaman	78	207	37.33333300	33.58333300	\N	\N	f
3471	Igdir	88	207	39.90000000	44.33333300	\N	\N	f
3472	Nigde	73	207	37.91666700	34.65000000	\N	\N	f
3473	Usak	64	207	38.25888900	28.90722200	\N	\N	f
3474	Siirt	74	207	37.89583300	41.70527800	\N	\N	f
3475	Kirklareli	39	207	41.46055600	26.92583300	\N	\N	f
3476	Burdur	15	207	37.64944400	30.53416700	\N	\N	f
3477	Gumushane	69	207	40.13333300	39.13333300	\N	\N	f
3478	Osmaniye	91	207	37.22833300	35.88083300	\N	\N	f
3479	Yalova	92	207	40.69750000	29.51138900	\N	\N	f
3480	Kars	84	207	40.23333300	43.13333300	\N	\N	f
3481	Tobago	11	208	11.20000000	-60.71666670	\N	\N	f
3482	Caroni	02	208	10.48333330	-61.40000000	\N	\N	f
3483	Saint David	07	208	10.83333330	-60.96666670	\N	\N	f
3484	Arima	01	208	10.63333330	-61.28333330	\N	\N	f
3485	Saint George	08	208	10.63333330	-61.33333330	\N	\N	f
3486	Saint Patrick	09	208	10.20000000	-61.53333330	\N	\N	f
3487	Victoria	12	208	10.20000000	-61.40000000	\N	\N	f
3488	Nariva	04	208	10.43333330	-61.13333330	\N	\N	f
3489	Port-of-Spain	05	208	10.66666670	-61.51666670	\N	\N	f
3490	Saint Andrew	06	208	10.55000000	-61.06666670	\N	\N	f
3491	Mayaro	03	208	10.13333330	-61.03333330	\N	\N	f
3492	San Fernando	10	208	10.30000000	-61.45000000	\N	\N	f
3494	Tai-wan	04	210	24.63333330	121.80000000	\N	\N	f
3495	Tai-pei	03	210	24.98333330	121.60000000	\N	\N	f
3496	Fu-chien	01	210	24.46833330	118.32444440	\N	\N	f
3497	Kao-hsiung	02	210	22.65000000	120.30000000	\N	\N	f
3499	Tabora	17	211	-1.81638890	30.95194440	\N	\N	f
3500	Manyara	27	211	-5.03333330	36.05000000	\N	\N	f
3501	Mtwara	11	211	-10.91666670	39.16666670	\N	\N	f
3502	Lindi	07	211	-10.76666670	38.73333330	\N	\N	f
3503	Ruvuma	14	211	-9.58333330	37.43333330	\N	\N	f
3504	Iringa	04	211	-8.68333330	36.30000000	\N	\N	f
3505	Tanga	18	211	-5.10000000	38.63333330	\N	\N	f
3506	Pemba South	20	211	-5.36666670	39.71666670	\N	\N	f
3507	Kagera	19	211	-1.28888890	31.66500000	\N	\N	f
3508	Arusha	26	211	-2.40000000	35.50000000	\N	\N	f
3509	Mwanza	12	211	-2.46666670	32.63333330	\N	\N	f
3510	Kilimanjaro	06	211	-3.58333330	37.33333330	\N	\N	f
3511	Pwani	02	211	-7.43333330	39.11666670	\N	\N	f
3512	Zanzibar Central	21	211	-6.11666670	39.28333330	\N	\N	f
3513	Dodoma	03	211	-5.63333330	35.70000000	\N	\N	f
3514	Shinyanga	15	211	-3.60000000	33.98333330	\N	\N	f
3515	Zanzibar Urban	25	211	-6.43333330	38.90000000	\N	\N	f
3516	Pemba North	13	211	-5.10000000	39.75000000	\N	\N	f
3517	Mara	08	211	-2.26666670	34.85000000	\N	\N	f
3518	Dar es Salaam	23	211	-7.05000000	38.80000000	\N	\N	f
3519	Zanzibar North	22	211	-5.73333330	39.30000000	\N	\N	f
3520	Mbeya	09	211	-9.90000000	34.43333330	\N	\N	f
3521	Singida	16	211	-5.71666670	34.55000000	\N	\N	f
3522	Kigoma	05	211	-4.90000000	29.60000000	\N	\N	f
3523	Morogoro	10	211	-5.61666670	37.98333330	\N	\N	f
3524	Rukwa	24	211	-8.46666670	31.15000000	\N	\N	f
3525	Krym	11	212	45.78333300	34.11666700	\N	\N	f
3526	Odeska Oblast	17	212	47.98694400	29.26611100	\N	\N	f
3527	Kharkivska Oblast	07	212	49.87111100	38.04083300	\N	\N	f
3528	Poltavska Oblast	18	212	49.60000000	34.35000000	\N	\N	f
3529	Kyyivska Oblast	13	212	50.75000000	30.10000000	\N	\N	f
3530	Zakarpatska Oblast	25	212	48.73333300	23.08333300	\N	\N	f
3531	Sumska Oblast	21	212	50.30861100	34.89416700	\N	\N	f
3532	Donetska Oblast	05	212	47.80000000	37.91666700	\N	\N	f
3533	Khersonska Oblast	08	212	46.11666700	33.48333300	\N	\N	f
3534	Lvivska Oblast	15	212	51.41666700	23.71666700	\N	\N	f
3535	Cherkaska Oblast	01	212	49.15000000	32.68333300	\N	\N	f
3536	Vinnytska Oblast	23	212	48.86666700	29.51666700	\N	\N	f
3537	Rivnenska Oblast	19	212	50.73333300	26.08333300	\N	\N	f
3538	Khmelnytska Oblast	09	212	50.08333300	27.41666700	\N	\N	f
3539	Chernihivska Oblast	02	212	51.01666700	31.33333300	\N	\N	f
3540	Dnipropetrovska Oblast	04	212	48.31666700	34.21666700	\N	\N	f
3541	Mykolayivska Oblast	16	212	46.85000000	31.38333300	\N	\N	f
3542	Ternopilska Oblast	22	212	49.43333300	24.95000000	\N	\N	f
3543	Zhytomyrska Oblast	27	212	50.43333300	28.18333300	\N	\N	f
3544	Chernivetska Oblast	03	212	48.08638900	25.92111100	\N	\N	f
3545	Luhanska Oblast	14	212	48.36222200	38.72194400	\N	\N	f
3546	Sevastopol	20	212	44.58333300	33.83333300	\N	\N	f
3547	Kirovohradska Oblast	10	212	48.54305600	32.53611100	\N	\N	f
3548	Ivano-Frankivska Oblast	06	212	48.35000000	24.83333300	\N	\N	f
3549	Zaporizka Oblast	26	212	46.68972200	35.15361100	\N	\N	f
3550	Volynska Oblast	24	212	51.50000000	24.83333300	\N	\N	f
3552	Nebbi	58	213	2.45000000	30.86666670	\N	\N	f
3553	Katakwi	69	213	2.21666670	33.48333330	\N	\N	f
3554	Lira	47	213	2.38277780	33.04500000	\N	\N	f
3555	Apac	26	213	1.73333330	32.40000000	\N	\N	f
3556	Kaberamaido	80	213	1.75000000	33.15000000	\N	\N	f
3557	Arua	77	213	2.95000000	31.38333330	\N	\N	f
3558	Soroti	95	213	1.70000000	33.73333330	\N	\N	f
3559	Tororo	76	213	0.68805560	34.03888890	\N	\N	f
3560	Gulu	30	213	2.93333330	32.53333330	\N	\N	f
3561	Pallisa	60	213	1.38333330	33.70000000	\N	\N	f
3562	Pader	92	213	3.12583330	32.91972220	\N	\N	f
3563	Kumi	46	213	1.33333330	33.95000000	\N	\N	f
3564	Adjumani	65	213	3.41666670	31.91666670	\N	\N	f
3565	Kotido	45	213	2.81666670	33.98333330	\N	\N	f
3566	Kitgum	84	213	3.75944440	33.03694440	\N	\N	f
3567	Masindi	50	213	1.85000000	32.40000000	\N	\N	f
3568	Mbarara	52	213	-0.13333330	30.53333330	\N	\N	f
3570	Bundibugyo	28	213	0.81666670	30.13333330	\N	\N	f
3571	Nakapiripirit	91	213	1.95000000	34.95000000	\N	\N	f
3572	Moroto	88	213	2.80500000	34.28055560	\N	\N	f
3573	Moyo	72	213	3.63333330	31.81666670	\N	\N	f
3574	Mbale	87	213	0.79166670	34.15916670	\N	\N	f
3575	Yumbe	97	213	3.45000000	31.28333330	\N	\N	f
3576	Kapchorwa	39	213	1.50000000	34.43333330	\N	\N	f
3577	Nakasongola	73	213	1.67638890	32.24111110	\N	\N	f
3578	Mubende	56	213	0.55000000	31.35000000	\N	\N	f
3579	Kisoro	43	213	-1.30000000	29.76666670	\N	\N	f
3580	Iganga	78	213	0.55000000	33.40000000	\N	\N	f
3581	Kayunga	83	213	1.20000000	32.86666670	\N	\N	f
3582	Mukono	90	213	0.38333330	32.71666670	\N	\N	f
3583	Mpigi	89	213	0.03333330	32.28333330	\N	\N	f
3584	Kamuli	38	213	1.02861110	33.09277780	\N	\N	f
3585	Luwero	70	213	0.65000000	32.48333330	\N	\N	f
3586	Masaka	71	213	-0.35000000	31.86666670	\N	\N	f
3587	Rakai	61	213	-0.40000000	31.41666670	\N	\N	f
3588	Kalangala	36	213	0.43333330	32.56666670	\N	\N	f
3589	Kibale	41	213	0.68333330	31.05000000	\N	\N	f
3590	Bugiri	66	213	0.24527780	33.87111110	\N	\N	f
3591	Wakiso	96	213	0.45000000	32.48333330	\N	\N	f
3592	Kiboga	42	213	1.05000000	31.65000000	\N	\N	f
3593	Kampala	37	213	0.35000000	32.88333330	\N	\N	f
3594	Mayuge	86	213	0.41666670	33.45000000	\N	\N	f
3595	Kyenjojo	85	213	0.40000000	30.41666670	\N	\N	f
3596	Rukungiri	93	213	-1.01666670	29.93333330	\N	\N	f
3597	Bushenyi	29	213	-0.43694440	30.43833330	\N	\N	f
3598	Hoima	31	213	1.58277780	31.11888890	\N	\N	f
3599	Kamwenge	81	213	0.31250000	30.57722220	\N	\N	f
3600	Kabarole	79	213	0.63333330	30.16666670	\N	\N	f
3601	Sironko	94	213	1.03333330	34.21666670	\N	\N	f
3602	Kasese	40	213	0.10000000	29.80000000	\N	\N	f
3603	Sembabule	74	213	-0.01666670	31.05000000	\N	\N	f
3605	Jinja	33	213	0.55694440	33.27638890	\N	\N	f
3606	Busia	67	213	0.35111110	34.02472220	\N	\N	f
3607	Ntungamo	59	213	-0.81666670	30.25000000	\N	\N	f
3608	Kanungu	82	213	-1.00000000	29.81666670	\N	\N	f
3610	Alabama	AL	230	33.10083330	-85.52972220	\N	\N	f
3611	Alaska	AK	230	51.88000000	-176.65805560	\N	\N	f
3612	American Samoa	AS	230	-14.32027780	-170.76388890	\N	\N	f
3613	Arizona	AZ	230	33.29583330	-111.84111110	\N	\N	f
3614	Arkansas	AR	230	36.07972220	-90.93972220	\N	\N	f
3615	California	CA	230	39.02055560	-121.62444440	\N	\N	f
3616	Colorado	CO	230	39.85055560	-102.70666670	\N	\N	f
3617	Connecticut	CT	230	41.86055560	-72.00722220	\N	\N	f
3618	Delaware	DE	230	38.88638890	-75.47694440	\N	\N	f
3619	District of Columbia	DC	230	38.92138890	-77.04250000	\N	\N	f
3620	Florida	FL	230	30.36555560	-85.14750000	\N	\N	f
3621	Georgia	GA	230	32.56805560	-81.99250000	\N	\N	f
3622	Guam	GU	230	13.48944440	144.85305560	\N	\N	f
3623	Hawaii	HI	230	20.85333330	-156.46472220	\N	\N	f
3624	Idaho	ID	230	42.94416670	-112.83750000	\N	\N	f
3625	Illinois	IL	230	37.55722220	-88.69888890	\N	\N	f
3626	Indiana	IN	230	38.88305560	-85.12583330	\N	\N	f
3627	Iowa	IA	230	42.48527780	-93.06611110	\N	\N	f
3628	Kansas	KS	230	37.97083330	-98.20388890	\N	\N	f
3629	Kentucky	KY	230	36.81250000	-85.18083330	\N	\N	f
3630	Louisiana	LA	230	29.97444440	-92.13416670	\N	\N	f
3631	Maine	ME	230	45.18638890	-69.45250000	\N	\N	f
3632	Marshall Islands	MH	230	5.91666670	172.13333330	\N	\N	f
3633	Maryland	MD	230	38.25416670	-76.74388890	\N	\N	f
3634	Massachusetts	MA	230	42.34444440	-71.15000000	\N	\N	f
3635	Michigan	MI	230	43.02000000	-82.63333330	\N	\N	f
3636	Federated States of Micronesia	FM	230	6.93583330	158.27500000	\N	\N	f
3637	Minnesota	MN	230	45.08416670	-94.66055560	\N	\N	f
3638	Mississippi	MS	230	34.50305560	-89.50305560	\N	\N	f
3639	Missouri	MO	230	38.42305560	-94.15361110	\N	\N	f
3640	Montana	MT	230	48.55250000	-109.68055560	\N	\N	f
3641	Nebraska	NE	230	40.97472220	-98.48111110	\N	\N	f
3642	Nevada	NV	230	37.54833330	-114.17166670	\N	\N	f
3643	New Hampshire	NH	230	43.01805560	-70.76666670	\N	\N	f
3644	New Jersey	NJ	230	40.08833330	-74.22916670	\N	\N	f
3645	New Mexico	NM	230	36.30555560	-104.25833330	\N	\N	f
3646	New York	NY	230	42.25694440	-78.31888890	\N	\N	f
3647	North Carolina	NC	230	36.53805560	-80.29611110	\N	\N	f
3648	North Dakota	ND	230	46.44777780	-96.73000000	\N	\N	f
3649	Northern Mariana Islands	MP	230	15.12694440	145.69277780	\N	\N	f
3650	Ohio	OH	230	40.76000000	-84.69833330	\N	\N	f
3651	Oklahoma	OK	230	33.83333330	-96.38694440	\N	\N	f
3652	Oregon	OR	230	43.98000000	-124.05972220	\N	\N	f
3653	Palau	PW	230	7.35750000	134.55777780	\N	\N	f
3654	Pennsylvania	PA	230	40.89972220	-77.45361110	\N	\N	f
3655	Puerto Rico	PR	230	18.44527780	-67.06527780	\N	\N	f
3656	Rhode Island	RI	230	41.95527780	-71.38944440	\N	\N	f
3657	South Carolina	SC	230	34.17805560	-82.37916670	\N	\N	f
3658	South Dakota	SD	230	45.46472220	-98.48611110	\N	\N	f
3659	Tennessee	TN	230	35.92833330	-86.52000000	\N	\N	f
3660	Texas	TX	230	28.44166670	-99.76000000	\N	\N	f
3661	Utah	UT	230	40.77194440	-111.90027780	\N	\N	f
3662	Vermont	VT	230	44.32916670	-72.50333330	\N	\N	f
3663	Virgin Islands	VI	230	18.35027780	-64.98388890	\N	\N	f
3664	Virginia	VA	230	38.95500000	-77.27638890	\N	\N	f
3665	Washington	WA	230	46.97555560	-123.81444440	\N	\N	f
3666	West Virginia	WV	230	38.49305560	-81.53444440	\N	\N	f
3667	Wisconsin	WI	230	44.94638890	-90.31583330	\N	\N	f
3668	Wyoming	WY	230	44.91055560	-106.98444440	\N	\N	f
3669	Rocha	14	214	-33.68333330	-53.55000000	\N	\N	f
3670	Florida	07	214	-34.41166670	-56.40222220	\N	\N	f
3671	Montevideo	10	214	-34.76416670	-56.21388890	\N	\N	f
3672	Rivera	13	214	-31.75000000	-55.01666670	\N	\N	f
3673	Cerro Largo	03	214	-31.86666670	-54.20000000	\N	\N	f
3674	Tacuarembo	18	214	-32.41666670	-56.16666670	\N	\N	f
3675	Lavalleja	08	214	-33.53333330	-54.43333330	\N	\N	f
3676	Treinta y Tres	19	214	-33.23333330	-53.85000000	\N	\N	f
3677	Soriano	17	214	-33.80000000	-58.25000000	\N	\N	f
3678	Durazno	05	214	-32.80000000	-55.80000000	\N	\N	f
3679	Canelones	02	214	-34.52194440	-56.39361110	\N	\N	f
3680	Flores	06	214	-33.75000000	-56.46666670	\N	\N	f
3681	Maldonado	09	214	-34.20000000	-54.75000000	\N	\N	f
3682	Salto	15	214	-31.33333330	-57.80000000	\N	\N	f
3683	Rio Negro	12	214	-32.41666670	-57.38333330	\N	\N	f
3684	Artigas	01	214	-30.30000000	-56.96666670	\N	\N	f
3685	Paysandu	11	214	-31.90000000	-55.46666670	\N	\N	f
3686	Colonia	04	214	-34.36666670	-57.56666670	\N	\N	f
3687	San Jose	16	214	-34.31666670	-57.00000000	\N	\N	f
3688	Khorazm	05	215	41.40000000	60.70000000	\N	\N	f
3689	Qashqadaryo	08	215	38.91527780	65.79666670	\N	\N	f
3690	Samarqand	10	215	40.08333330	65.60000000	\N	\N	f
3691	Andijon	01	215	40.76666670	71.96666670	\N	\N	f
3692	Jizzax	15	215	39.90000000	67.61666670	\N	\N	f
3693	Toshkent	14	215	41.56666670	70.11666670	\N	\N	f
3694	Surkhondaryo	12	215	37.45000000	67.21666670	\N	\N	f
3695	Qoraqalpoghiston	09	215	43.03333330	58.78333330	\N	\N	f
3696	Nawoiy	07	215	41.70000000	64.53333330	\N	\N	f
3698	Namangan	06	215	41.06666670	71.80000000	\N	\N	f
3699	Farghona	03	215	40.35000000	70.76666670	\N	\N	f
3700	Bukhoro	02	215	39.53333330	63.73333330	\N	\N	f
3701	Toshkent	13	215	41.30500000	69.20777780	\N	\N	f
3703	Charlotte	01	216	13.18333330	-61.13333330	\N	\N	f
3704	Saint George	04	216	13.13333330	-61.20000000	\N	\N	f
3705	Grenadines	06	216	12.58333330	-61.43333330	\N	\N	f
3706	Saint Patrick	05	216	13.23333330	-61.26666670	\N	\N	f
3707	Saint Andrew	02	216	13.16666670	-61.23333330	\N	\N	f
3708	Saint David	03	216	13.28333330	-61.25000000	\N	\N	f
3709	Falcon	11	217	11.00000000	-70.66666670	\N	\N	f
3710	Apure	03	217	7.39166670	-71.63944440	\N	\N	f
3711	Bolivar	06	217	5.71666670	-62.30000000	\N	\N	f
3712	Tachira	20	217	7.60000000	-71.51666670	\N	\N	f
3713	Miranda	15	217	10.31722220	-66.55055560	\N	\N	f
3714	Guarico	12	217	9.28333330	-67.56666670	\N	\N	f
3715	Anzoategui	02	217	9.96666670	-65.16666670	\N	\N	f
3716	Nueva Esparta	17	217	11.05000000	-63.91666670	\N	\N	f
3717	Portuguesa	18	217	9.55972220	-69.20194440	\N	\N	f
3718	Sucre	19	217	10.23333330	-63.90000000	\N	\N	f
3719	Barinas	05	217	8.25000000	-69.98333330	\N	\N	f
3720	Lara	13	217	9.96666670	-70.41666670	\N	\N	f
3721	Zulia	23	217	10.76666670	-71.56666670	\N	\N	f
3722	Merida	14	217	8.43027780	-71.24194440	\N	\N	f
3723	Carabobo	07	217	10.05000000	-67.76666670	\N	\N	f
3724	Cojedes	08	217	9.83333330	-68.71666670	\N	\N	f
3725	Aragua	04	217	10.18333330	-67.11666670	\N	\N	f
3726	Yaracuy	22	217	10.16333330	-69.17833330	\N	\N	f
3727	Amazonas	01	217	5.48472220	-67.60527780	\N	\N	f
3728	Monagas	16	217	10.02777780	-63.31138890	\N	\N	f
3729	Trujillo	21	217	9.42138890	-70.58805560	\N	\N	f
3730	Vargas	26	217	10.45388890	-67.26944440	\N	\N	f
3732	Delta Amacuro	09	217	8.71416670	-60.94527780	\N	\N	f
3733	Distrito Federal	25	217	10.46666670	-66.98333330	\N	\N	f
3734	Dependencias Federales	24	217	11.95000000	-66.66666670	\N	\N	f
3742	Thanh Hoa	34	220	20.36666670	105.28333330	\N	\N	f
3745	Quang Nam	84	220	15.88333330	108.11666670	\N	\N	f
3746	Son La	32	220	21.58333330	103.98333330	\N	\N	f
3751	Tay Ninh	33	220	11.51666670	106.23333330	\N	\N	f
3753	Thai Binh	35	220	20.58333330	106.56666670	\N	\N	f
3754	Kien Giang	21	220	9.76944440	105.02500000	\N	\N	f
3755	Dong Thap	09	220	10.78333330	105.35000000	\N	\N	f
3761	Soc Trang	65	220	9.50694440	106.06861110	\N	\N	f
3764	Ben Tre	03	220	9.90222220	106.54333330	\N	\N	f
3765	Ho Chi Minh	20	220	10.71333330	106.60472220	\N	\N	f
3766	Tra Vinh	67	220	9.91527780	106.14416670	\N	\N	f
3767	Hai Phong	13	220	20.85000000	106.66666670	\N	\N	f
3768	Cao Bang	05	220	22.73333330	106.13333330	\N	\N	f
3769	An Giang	01	220	10.70000000	105.11666670	\N	\N	f
3772	Nghe An	58	220	18.90000000	105.31666670	\N	\N	f
3773	Gia Lai	49	220	13.95000000	108.65000000	\N	\N	f
3774	Lam Dong	23	220	11.98333330	108.35000000	\N	\N	f
3775	Binh Dinh	46	220	14.56666670	108.90000000	\N	\N	f
3776	Binh Phuoc	76	220	11.65000000	106.60000000	\N	\N	f
3777	Lang Son	39	220	22.30000000	106.31666670	\N	\N	f
3778	Tien Giang	37	220	10.31666670	106.03333330	\N	\N	f
3779	Long An	24	220	10.56666670	106.53333330	\N	\N	f
3780	Ninh Thuan	60	220	11.51666670	108.91666670	\N	\N	f
3781	Quang Ninh	30	220	20.98333330	107.00000000	\N	\N	f
3782	Bac Lieu	73	220	9.05638890	105.44055560	\N	\N	f
3783	Ca Mau	77	220	9.15333330	105.21333330	\N	\N	f
3786	Binh Duong	75	220	11.40000000	106.60000000	\N	\N	f
3787	Binh Thuan	47	220	11.16666670	108.56666670	\N	\N	f
3788	Vinh Long	69	220	9.95805560	106.08666670	\N	\N	f
3789	Dong Nai	43	220	11.40000000	107.38333330	\N	\N	f
3791	Bac Kan	72	220	22.13333330	105.83333330	\N	\N	f
3792	Bac Giang	71	220	21.26666670	106.20000000	\N	\N	f
3793	Thua Thien-Hue	66	220	16.20000000	107.86666670	\N	\N	f
3794	Bac Ninh	74	220	21.18333330	106.05000000	\N	\N	f
3795	Ha Giang	50	220	22.48333330	104.86666670	\N	\N	f
3796	Tuyen Quang	68	220	22.06666670	105.05000000	\N	\N	f
3797	Thai Nguyen	85	220	21.41500000	105.87416670	\N	\N	f
3798	Da Nang	78	220	15.98333330	107.98333330	\N	\N	f
3799	Khanh Hoa	54	220	11.90000000	109.15000000	\N	\N	f
3800	Ba Ria-Vung Tau	45	220	10.50000000	107.16666670	\N	\N	f
3801	Quang Ngai	63	220	14.76666670	108.73333330	\N	\N	f
3803	Ha Nam	80	220	20.48333330	106.01666670	\N	\N	f
3804	Phu Yen	61	220	13.45000000	109.21666670	\N	\N	f
3805	Quang Binh	62	220	17.58333330	106.53333330	\N	\N	f
3806	Phu Tho	83	220	21.43333330	105.11666670	\N	\N	f
3807	Quang Tri	64	220	16.81666670	106.98333330	\N	\N	f
3808	Ha Tinh	52	220	18.28333330	105.96666670	\N	\N	f
3809	Kon Tum	55	220	14.63333330	108.40000000	\N	\N	f
3811	Yen Bai	70	220	21.63333330	105.16666670	\N	\N	f
3812	Ninh Binh	59	220	20.10000000	106.10000000	\N	\N	f
3813	Nam Dinh	82	220	20.28333330	106.45000000	\N	\N	f
3814	Hai Duong	79	220	20.93333330	106.31666670	\N	\N	f
3815	Ha Noi	44	220	21.03333330	105.85000000	\N	\N	f
3816	Hoa Binh	53	220	20.81333330	105.33833330	\N	\N	f
3817	Hung Yen	81	220	20.65000000	106.06666670	\N	\N	f
3818	Vinh Phuc	86	220	21.45361110	105.64361110	\N	\N	f
3819	Sanma	13	221	-15.10000000	167.06666670	\N	\N	f
3820	Aoba	06	221	-15.31666670	167.88333330	\N	\N	f
3821	Shepherd	14	221	-16.90000000	168.53333330	\N	\N	f
3822	Malakula	10	221	-16.51666670	167.65000000	\N	\N	f
3823	Pentecote	12	221	-15.51666670	168.15000000	\N	\N	f
3824	Torba	07	221	-13.70000000	167.63333330	\N	\N	f
3825	Efate	08	221	-17.73333330	168.30111110	\N	\N	f
3826	Tafea	15	221	-20.13333330	169.81666670	\N	\N	f
3827	Ambrym	05	221	-16.28333330	167.98333330	\N	\N	f
3828	Epi	09	221	-16.78333330	168.16666670	\N	\N	f
3829	Paama	11	221	-16.45000000	168.21666670	\N	\N	f
3832	Lahij	06	224	13.70000000	44.66666670	\N	\N	f
3833	Sadah	15	224	16.85000000	43.18333330	\N	\N	f
3834	Al Hudaydah	08	224	14.03916670	43.49055560	\N	\N	f
3835	Marib	14	224	14.75000000	45.66666670	\N	\N	f
3836	Al Bayda	07	224	14.33750000	45.15000000	\N	\N	f
3837	Dhamar	11	224	14.42972220	44.50472220	\N	\N	f
3838	Sana	16	224	16.40000000	44.08333330	\N	\N	f
3839	Al Mahrah	03	224	16.33333330	52.31666670	\N	\N	f
3840	Hadramawt	04	224	16.50000000	48.83333330	\N	\N	f
3841	Taizz	17	224	13.68333330	44.33333330	\N	\N	f
3842	Hajjah	12	224	16.00277780	43.19666670	\N	\N	f
3843	Abyan	01	224	13.38638890	45.41305560	\N	\N	f
3844	Ibb	13	224	14.33250000	44.10722220	\N	\N	f
3845	Adan	02	224	12.77944440	45.03666670	\N	\N	f
3846	Al Mahwit	10	224	15.51666670	43.91666670	\N	\N	f
3847	Al Jawf	09	224	16.71361110	44.89194440	\N	\N	f
3850	Western Cape	11	226	-33.70000000	19.50000000	\N	\N	f
3851	Eastern Cape	05	226	-31.70000000	25.61666670	\N	\N	f
3852	Mpumalanga	07	226	-26.28333330	29.26666670	\N	\N	f
3853	Free State	03	226	-30.53333330	26.98333330	\N	\N	f
3854	North-West	10	226	-25.48333330	26.16666670	\N	\N	f
3855	Limpopo	09	226	-23.45000000	28.08333330	\N	\N	f
3856	KwaZulu-Natal	02	226	-28.76666670	32.06666670	\N	\N	f
3857	North-Western Province	01	226	-29.20000000	18.85000000	\N	\N	f
3858	Gauteng	06	226	-25.65611110	28.09277780	\N	\N	f
3859	Northern Cape	08	226	-28.58333330	16.48333330	\N	\N	f
3861	Southern	07	227	-10.23333330	31.21666670	\N	\N	f
3862	North-Western	06	227	-14.48333330	30.88333330	\N	\N	f
3863	Northern	05	227	-12.71666670	30.45000000	\N	\N	f
3864	Western	01	227	-13.30000000	23.20000000	\N	\N	f
3865	Eastern	03	227	-17.23333330	25.03333330	\N	\N	f
3866	Copperbelt	08	227	-9.28333330	28.43333330	\N	\N	f
3867	Luapula	04	227	-16.33333330	28.80000000	\N	\N	f
3868	Central	02	227	-13.41666670	28.76666670	\N	\N	f
3869	Lusaka	09	227	-15.51666670	28.23333330	\N	\N	f
3883	Matabeleland North	06	229	-20.20861110	28.72138890	\N	\N	f
3884	Mashonaland East	04	229	-17.76222220	30.98888890	\N	\N	f
3885	Mashonaland Central	03	229	-17.36666670	30.95000000	\N	\N	f
3886	Matabeleland South	07	229	-20.41944440	31.96388890	\N	\N	f
3888	Masvingo	08	229	-21.53333330	31.48333330	\N	\N	f
\.


--
-- TOC entry 3947 (class 0 OID 41587)
-- Dependencies: 241
-- Data for Name: reporting_reports; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.reporting_reports (id, attachment_type, path, valide, mobileuserid_id, moderatorid_id) FROM stdin;
\.


--
-- TOC entry 3959 (class 0 OID 41694)
-- Dependencies: 253
-- Data for Name: robots_commentrobotscontent; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.robots_commentrobotscontent (id, content, date, mobileuserid_id, robotcontentid_id) FROM stdin;
\.


--
-- TOC entry 3957 (class 0 OID 41685)
-- Dependencies: 251
-- Data for Name: robots_robotscontent; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.robots_robotscontent (id, source_type, url, date, valide, moderatorid_id) FROM stdin;
\.


--
-- TOC entry 3931 (class 0 OID 41354)
-- Dependencies: 225
-- Data for Name: users_admin; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_admin (id, user_id) FROM stdin;
\.


--
-- TOC entry 3929 (class 0 OID 41344)
-- Dependencies: 223
-- Data for Name: users_agent; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_agent (id, user_id) FROM stdin;
\.


--
-- TOC entry 3927 (class 0 OID 41334)
-- Dependencies: 221
-- Data for Name: users_mobileuser; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_mobileuser (id, user_id) FROM stdin;
\.


--
-- TOC entry 3925 (class 0 OID 41324)
-- Dependencies: 219
-- Data for Name: users_moderator; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_moderator (id, user_id) FROM stdin;
\.


--
-- TOC entry 3923 (class 0 OID 41314)
-- Dependencies: 217
-- Data for Name: users_redactor; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_redactor (id, user_id) FROM stdin;
\.


--
-- TOC entry 3917 (class 0 OID 41282)
-- Dependencies: 211
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email, user_type) FROM stdin;
1	pbkdf2_sha256$180000$zZmeZvrTn0mD$i0Dq28SCtPtTEqknUHeV2n0D5DSayEUphkA6wzSgGaw=	2020-03-11 22:08:09.602613+00	t	patch			t	t	2020-03-11 22:07:50.904286+00	gl_bouchafa@esi.dz	0
\.


--
-- TOC entry 3919 (class 0 OID 41298)
-- Dependencies: 213
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3921 (class 0 OID 41306)
-- Dependencies: 215
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3951 (class 0 OID 41619)
-- Dependencies: 245
-- Data for Name: videosHomePage_commentthematicvideo; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public."videosHomePage_commentthematicvideo" (id, content, date, mobileuserid_id, "thematicVideoid_id") FROM stdin;
\.


--
-- TOC entry 3949 (class 0 OID 41608)
-- Dependencies: 243
-- Data for Name: videosHomePage_thematicvideo; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public."videosHomePage_thematicvideo" (id, title, date, path, valide, mobileuserid_id, moderatorid_id) FROM stdin;
\.


--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 234
-- Name: articles_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.articles_article_id_seq', 1, false);


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 238
-- Name: articles_attachmentarticle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.articles_attachmentarticle_id_seq', 1, false);


--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 236
-- Name: articles_commentarticle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.articles_commentarticle_id_seq', 1, false);


--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 104, true);


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 197
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 226
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 5, true);


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 26, true);


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 232
-- Name: geo_infectedregions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.geo_infectedregions_id_seq', 1, false);


--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 230
-- Name: geo_receptioncenter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.geo_receptioncenter_id_seq', 1, false);


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 248
-- Name: health_healthinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.health_healthinfo_id_seq', 1, false);


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 246
-- Name: health_photoanalyze_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.health_photoanalyze_id_seq', 1, false);


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 199
-- Name: regionsv3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regionsv3_id_seq', 1, false);


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 240
-- Name: reporting_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.reporting_reports_id_seq', 1, false);


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 252
-- Name: robots_commentrobotscontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.robots_commentrobotscontent_id_seq', 1, false);


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 250
-- Name: robots_robotscontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.robots_robotscontent_id_seq', 1, false);


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_admin_id_seq', 1, false);


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_agent_id_seq', 1, false);


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_mobileuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_mobileuser_id_seq', 2, true);


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_moderator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_moderator_id_seq', 1, false);


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_redactor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_redactor_id_seq', 1, false);


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 244
-- Name: videosHomePage_commentthematicvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public."videosHomePage_commentthematicvideo_id_seq"', 1, false);


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 242
-- Name: videosHomePage_thematicvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public."videosHomePage_thematicvideo_id_seq"', 1, false);


--
-- TOC entry 3709 (class 2606 OID 41534)
-- Name: articles_article articles_article_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_article
    ADD CONSTRAINT articles_article_pkey PRIMARY KEY (id);


--
-- TOC entry 3717 (class 2606 OID 41566)
-- Name: articles_attachmentarticle articles_attachmentarticle_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_attachmentarticle
    ADD CONSTRAINT articles_attachmentarticle_pkey PRIMARY KEY (id);


--
-- TOC entry 3714 (class 2606 OID 41557)
-- Name: articles_commentarticle articles_commentarticle_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_commentarticle
    ADD CONSTRAINT articles_commentarticle_pkey PRIMARY KEY (id);


--
-- TOC entry 3637 (class 2606 OID 41278)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3642 (class 2606 OID 41264)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3645 (class 2606 OID 41253)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3639 (class 2606 OID 41243)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3632 (class 2606 OID 41255)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3634 (class 2606 OID 41235)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3692 (class 2606 OID 41445)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 3694 (class 2606 OID 41447)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 3621 (class 2606 OID 41005)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3688 (class 2606 OID 41428)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3627 (class 2606 OID 41227)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3629 (class 2606 OID 41225)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3625 (class 2606 OID 41217)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3697 (class 2606 OID 41466)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3703 (class 2606 OID 41499)
-- Name: geo_infectedregions geo_infectedregions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.geo_infectedregions
    ADD CONSTRAINT geo_infectedregions_pkey PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 41491)
-- Name: geo_receptioncenter geo_receptioncenter_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.geo_receptioncenter
    ADD CONSTRAINT geo_receptioncenter_pkey PRIMARY KEY (id);


--
-- TOC entry 3735 (class 2606 OID 41670)
-- Name: health_healthinfo health_healthinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_healthinfo
    ADD CONSTRAINT health_healthinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 3732 (class 2606 OID 41659)
-- Name: health_photoanalyze health_photoanalyze_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_photoanalyze
    ADD CONSTRAINT health_photoanalyze_pkey PRIMARY KEY (id);


--
-- TOC entry 3623 (class 2606 OID 41013)
-- Name: regions regionsv3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regionsv3_pkey PRIMARY KEY (id);


--
-- TOC entry 3721 (class 2606 OID 41593)
-- Name: reporting_reports reporting_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.reporting_reports
    ADD CONSTRAINT reporting_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3741 (class 2606 OID 41702)
-- Name: robots_commentrobotscontent robots_commentrobotscontent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.robots_commentrobotscontent
    ADD CONSTRAINT robots_commentrobotscontent_pkey PRIMARY KEY (id);


--
-- TOC entry 3738 (class 2606 OID 41691)
-- Name: robots_robotscontent robots_robotscontent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.robots_robotscontent
    ADD CONSTRAINT robots_robotscontent_pkey PRIMARY KEY (id);


--
-- TOC entry 3683 (class 2606 OID 41359)
-- Name: users_admin users_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_admin
    ADD CONSTRAINT users_admin_pkey PRIMARY KEY (id);


--
-- TOC entry 3685 (class 2606 OID 41361)
-- Name: users_admin users_admin_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_admin
    ADD CONSTRAINT users_admin_user_id_key UNIQUE (user_id);


--
-- TOC entry 3679 (class 2606 OID 41349)
-- Name: users_agent users_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_agent
    ADD CONSTRAINT users_agent_pkey PRIMARY KEY (id);


--
-- TOC entry 3681 (class 2606 OID 41351)
-- Name: users_agent users_agent_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_agent
    ADD CONSTRAINT users_agent_user_id_key UNIQUE (user_id);


--
-- TOC entry 3675 (class 2606 OID 41339)
-- Name: users_mobileuser users_mobileuser_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_mobileuser
    ADD CONSTRAINT users_mobileuser_pkey PRIMARY KEY (id);


--
-- TOC entry 3677 (class 2606 OID 41341)
-- Name: users_mobileuser users_mobileuser_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_mobileuser
    ADD CONSTRAINT users_mobileuser_user_id_key UNIQUE (user_id);


--
-- TOC entry 3671 (class 2606 OID 41329)
-- Name: users_moderator users_moderator_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_moderator
    ADD CONSTRAINT users_moderator_pkey PRIMARY KEY (id);


--
-- TOC entry 3673 (class 2606 OID 41331)
-- Name: users_moderator users_moderator_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_moderator
    ADD CONSTRAINT users_moderator_user_id_key UNIQUE (user_id);


--
-- TOC entry 3667 (class 2606 OID 41319)
-- Name: users_redactor users_redactor_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_redactor
    ADD CONSTRAINT users_redactor_pkey PRIMARY KEY (id);


--
-- TOC entry 3669 (class 2606 OID 41321)
-- Name: users_redactor users_redactor_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_redactor
    ADD CONSTRAINT users_redactor_user_id_key UNIQUE (user_id);


--
-- TOC entry 3648 (class 2606 OID 41295)
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- TOC entry 3656 (class 2606 OID 41303)
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3659 (class 2606 OID 41365)
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3650 (class 2606 OID 41291)
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3662 (class 2606 OID 41311)
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3665 (class 2606 OID 41379)
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3653 (class 2606 OID 41293)
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- TOC entry 3728 (class 2606 OID 41627)
-- Name: videosHomePage_commentthematicvideo videosHomePage_commentthematicvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public."videosHomePage_commentthematicvideo"
    ADD CONSTRAINT "videosHomePage_commentthematicvideo_pkey" PRIMARY KEY (id);


--
-- TOC entry 3725 (class 2606 OID 41616)
-- Name: videosHomePage_thematicvideo videosHomePage_thematicvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public."videosHomePage_thematicvideo"
    ADD CONSTRAINT "videosHomePage_thematicvideo_pkey" PRIMARY KEY (id);


--
-- TOC entry 3707 (class 1259 OID 41545)
-- Name: articles_article_moderatorid_id_ae8b6e0b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX articles_article_moderatorid_id_ae8b6e0b ON public.articles_article USING btree (moderatorid_id);


--
-- TOC entry 3710 (class 1259 OID 41546)
-- Name: articles_article_redactor_id_2d798096; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX articles_article_redactor_id_2d798096 ON public.articles_article USING btree (redactor_id);


--
-- TOC entry 3715 (class 1259 OID 41584)
-- Name: articles_attachmentarticle_articleid_id_3b3bf02a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX articles_attachmentarticle_articleid_id_3b3bf02a ON public.articles_attachmentarticle USING btree (articleid_id);


--
-- TOC entry 3711 (class 1259 OID 41577)
-- Name: articles_commentarticle_articleid_id_283e41fe; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX articles_commentarticle_articleid_id_283e41fe ON public.articles_commentarticle USING btree (articleid_id);


--
-- TOC entry 3712 (class 1259 OID 41578)
-- Name: articles_commentarticle_mobileuserid_id_c34293bd; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX articles_commentarticle_mobileuserid_id_c34293bd ON public.articles_commentarticle USING btree (mobileuserid_id);


--
-- TOC entry 3635 (class 1259 OID 41279)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3640 (class 1259 OID 41275)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3643 (class 1259 OID 41276)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3630 (class 1259 OID 41261)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3690 (class 1259 OID 41453)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 3686 (class 1259 OID 41439)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3689 (class 1259 OID 41440)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3695 (class 1259 OID 41468)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3698 (class 1259 OID 41467)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3704 (class 1259 OID 41523)
-- Name: geo_infectedregions_regionid_id_d1a24569; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX geo_infectedregions_regionid_id_d1a24569 ON public.geo_infectedregions USING btree (regionid_id);


--
-- TOC entry 3705 (class 1259 OID 41521)
-- Name: geo_infectedregions_riskagentid_876815b2; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX geo_infectedregions_riskagentid_876815b2 ON public.geo_infectedregions USING btree (riskagentid);


--
-- TOC entry 3706 (class 1259 OID 41522)
-- Name: geo_infectedregions_riskmoderatorid_d7ced7a9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX geo_infectedregions_riskmoderatorid_d7ced7a9 ON public.geo_infectedregions USING btree (riskmoderatorid);


--
-- TOC entry 3701 (class 1259 OID 41505)
-- Name: geo_receptioncenter_regionid_id_eb5eb953; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX geo_receptioncenter_regionid_id_eb5eb953 ON public.geo_receptioncenter USING btree (regionid_id);


--
-- TOC entry 3733 (class 1259 OID 41682)
-- Name: health_healthinfo_mobileuserid_id_32efa48f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX health_healthinfo_mobileuserid_id_32efa48f ON public.health_healthinfo USING btree (mobileuserid_id);


--
-- TOC entry 3730 (class 1259 OID 41676)
-- Name: health_photoanalyze_mobileuserid_id_15f449a5; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX health_photoanalyze_mobileuserid_id_15f449a5 ON public.health_photoanalyze USING btree (mobileuserid_id);


--
-- TOC entry 3718 (class 1259 OID 41604)
-- Name: reporting_reports_mobileuserid_id_f68607d7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX reporting_reports_mobileuserid_id_f68607d7 ON public.reporting_reports USING btree (mobileuserid_id);


--
-- TOC entry 3719 (class 1259 OID 41605)
-- Name: reporting_reports_moderatorid_id_b8074bab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX reporting_reports_moderatorid_id_b8074bab ON public.reporting_reports USING btree (moderatorid_id);


--
-- TOC entry 3739 (class 1259 OID 41719)
-- Name: robots_commentrobotscontent_mobileuserid_id_94a7aa2a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX robots_commentrobotscontent_mobileuserid_id_94a7aa2a ON public.robots_commentrobotscontent USING btree (mobileuserid_id);


--
-- TOC entry 3742 (class 1259 OID 41720)
-- Name: robots_commentrobotscontent_robotcontentid_id_f9fbde43; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX robots_commentrobotscontent_robotcontentid_id_f9fbde43 ON public.robots_commentrobotscontent USING btree (robotcontentid_id);


--
-- TOC entry 3736 (class 1259 OID 41708)
-- Name: robots_robotscontent_moderatorid_id_257912a6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX robots_robotscontent_moderatorid_id_257912a6 ON public.robots_robotscontent USING btree (moderatorid_id);


--
-- TOC entry 3646 (class 1259 OID 41363)
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- TOC entry 3654 (class 1259 OID 41377)
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- TOC entry 3657 (class 1259 OID 41376)
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- TOC entry 3660 (class 1259 OID 41391)
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3663 (class 1259 OID 41390)
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- TOC entry 3651 (class 1259 OID 41362)
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3726 (class 1259 OID 41650)
-- Name: videosHomePage_commentthematicvideo_mobileuserid_id_4f9a0d2a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX "videosHomePage_commentthematicvideo_mobileuserid_id_4f9a0d2a" ON public."videosHomePage_commentthematicvideo" USING btree (mobileuserid_id);


--
-- TOC entry 3729 (class 1259 OID 41651)
-- Name: videosHomePage_commentthematicvideo_thematicVideoid_id_88fec3dc; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX "videosHomePage_commentthematicvideo_thematicVideoid_id_88fec3dc" ON public."videosHomePage_commentthematicvideo" USING btree ("thematicVideoid_id");


--
-- TOC entry 3722 (class 1259 OID 41638)
-- Name: videosHomePage_thematicvideo_mobileuserid_id_989449aa; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX "videosHomePage_thematicvideo_mobileuserid_id_989449aa" ON public."videosHomePage_thematicvideo" USING btree (mobileuserid_id);


--
-- TOC entry 3723 (class 1259 OID 41639)
-- Name: videosHomePage_thematicvideo_moderatorid_id_2ab5bf78; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX "videosHomePage_thematicvideo_moderatorid_id_2ab5bf78" ON public."videosHomePage_thematicvideo" USING btree (moderatorid_id);


--
-- TOC entry 3765 (class 2606 OID 41535)
-- Name: articles_article articles_article_moderatorid_id_ae8b6e0b_fk_users_moderator_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_article
    ADD CONSTRAINT articles_article_moderatorid_id_ae8b6e0b_fk_users_moderator_id FOREIGN KEY (moderatorid_id) REFERENCES public.users_moderator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3766 (class 2606 OID 41540)
-- Name: articles_article articles_article_redactor_id_2d798096_fk_users_redactor_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_article
    ADD CONSTRAINT articles_article_redactor_id_2d798096_fk_users_redactor_id FOREIGN KEY (redactor_id) REFERENCES public.users_redactor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3769 (class 2606 OID 41579)
-- Name: articles_attachmentarticle articles_attachmenta_articleid_id_3b3bf02a_fk_articles_; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_attachmentarticle
    ADD CONSTRAINT articles_attachmenta_articleid_id_3b3bf02a_fk_articles_ FOREIGN KEY (articleid_id) REFERENCES public.articles_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3767 (class 2606 OID 41567)
-- Name: articles_commentarticle articles_commentarti_articleid_id_283e41fe_fk_articles_; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_commentarticle
    ADD CONSTRAINT articles_commentarti_articleid_id_283e41fe_fk_articles_ FOREIGN KEY (articleid_id) REFERENCES public.articles_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3768 (class 2606 OID 41572)
-- Name: articles_commentarticle articles_commentarti_mobileuserid_id_c34293bd_fk_users_mob; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.articles_commentarticle
    ADD CONSTRAINT articles_commentarti_mobileuserid_id_c34293bd_fk_users_mob FOREIGN KEY (mobileuserid_id) REFERENCES public.users_mobileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3748 (class 2606 OID 41270)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3747 (class 2606 OID 41265)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3746 (class 2606 OID 41256)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3760 (class 2606 OID 41454)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3758 (class 2606 OID 41429)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3759 (class 2606 OID 41434)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3764 (class 2606 OID 41516)
-- Name: geo_infectedregions geo_infectedregions_regionid_id_d1a24569_fk_regions_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.geo_infectedregions
    ADD CONSTRAINT geo_infectedregions_regionid_id_d1a24569_fk_regions_id FOREIGN KEY (regionid_id) REFERENCES public.regions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3762 (class 2606 OID 41506)
-- Name: geo_infectedregions geo_infectedregions_riskagentid_876815b2_fk_users_agent_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.geo_infectedregions
    ADD CONSTRAINT geo_infectedregions_riskagentid_876815b2_fk_users_agent_id FOREIGN KEY (riskagentid) REFERENCES public.users_agent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3763 (class 2606 OID 41511)
-- Name: geo_infectedregions geo_infectedregions_riskmoderatorid_d7ced7a9_fk_users_mod; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.geo_infectedregions
    ADD CONSTRAINT geo_infectedregions_riskmoderatorid_d7ced7a9_fk_users_mod FOREIGN KEY (riskmoderatorid) REFERENCES public.users_moderator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3761 (class 2606 OID 41500)
-- Name: geo_receptioncenter geo_receptioncenter_regionid_id_eb5eb953_fk_regions_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.geo_receptioncenter
    ADD CONSTRAINT geo_receptioncenter_regionid_id_eb5eb953_fk_regions_id FOREIGN KEY (regionid_id) REFERENCES public.regions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3777 (class 2606 OID 41677)
-- Name: health_healthinfo health_healthinfo_mobileuserid_id_32efa48f_fk_users_mob; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_healthinfo
    ADD CONSTRAINT health_healthinfo_mobileuserid_id_32efa48f_fk_users_mob FOREIGN KEY (mobileuserid_id) REFERENCES public.users_mobileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3776 (class 2606 OID 41671)
-- Name: health_photoanalyze health_photoanalyze_mobileuserid_id_15f449a5_fk_users_mob; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.health_photoanalyze
    ADD CONSTRAINT health_photoanalyze_mobileuserid_id_15f449a5_fk_users_mob FOREIGN KEY (mobileuserid_id) REFERENCES public.users_mobileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3744 (class 2606 OID 41470)
-- Name: regions regions_agent_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_agent_f FOREIGN KEY (riskagentid) REFERENCES public.users_agent(id);


--
-- TOC entry 3745 (class 2606 OID 41475)
-- Name: regions regions_moderator_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_moderator_fk FOREIGN KEY (riskmoderatorid) REFERENCES public.users_moderator(id);


--
-- TOC entry 3743 (class 2606 OID 41014)
-- Name: regions regionsv3_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regionsv3_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 3770 (class 2606 OID 41594)
-- Name: reporting_reports reporting_reports_mobileuserid_id_f68607d7_fk_users_mob; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.reporting_reports
    ADD CONSTRAINT reporting_reports_mobileuserid_id_f68607d7_fk_users_mob FOREIGN KEY (mobileuserid_id) REFERENCES public.users_mobileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3771 (class 2606 OID 41599)
-- Name: reporting_reports reporting_reports_moderatorid_id_b8074bab_fk_users_moderator_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.reporting_reports
    ADD CONSTRAINT reporting_reports_moderatorid_id_b8074bab_fk_users_moderator_id FOREIGN KEY (moderatorid_id) REFERENCES public.users_moderator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3779 (class 2606 OID 41709)
-- Name: robots_commentrobotscontent robots_commentrobots_mobileuserid_id_94a7aa2a_fk_users_mob; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.robots_commentrobotscontent
    ADD CONSTRAINT robots_commentrobots_mobileuserid_id_94a7aa2a_fk_users_mob FOREIGN KEY (mobileuserid_id) REFERENCES public.users_mobileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3780 (class 2606 OID 41714)
-- Name: robots_commentrobotscontent robots_commentrobots_robotcontentid_id_f9fbde43_fk_robots_ro; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.robots_commentrobotscontent
    ADD CONSTRAINT robots_commentrobots_robotcontentid_id_f9fbde43_fk_robots_ro FOREIGN KEY (robotcontentid_id) REFERENCES public.robots_robotscontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3778 (class 2606 OID 41703)
-- Name: robots_robotscontent robots_robotscontent_moderatorid_id_257912a6_fk_users_mod; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.robots_robotscontent
    ADD CONSTRAINT robots_robotscontent_moderatorid_id_257912a6_fk_users_mod FOREIGN KEY (moderatorid_id) REFERENCES public.users_moderator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3757 (class 2606 OID 41412)
-- Name: users_admin users_admin_user_id_a330be1e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_admin
    ADD CONSTRAINT users_admin_user_id_a330be1e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3756 (class 2606 OID 41407)
-- Name: users_agent users_agent_user_id_5c88bcd3_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_agent
    ADD CONSTRAINT users_agent_user_id_5c88bcd3_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3755 (class 2606 OID 41402)
-- Name: users_mobileuser users_mobileuser_user_id_d22fd7d1_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_mobileuser
    ADD CONSTRAINT users_mobileuser_user_id_d22fd7d1_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3754 (class 2606 OID 41397)
-- Name: users_moderator users_moderator_user_id_467bd895_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_moderator
    ADD CONSTRAINT users_moderator_user_id_467bd895_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3753 (class 2606 OID 41392)
-- Name: users_redactor users_redactor_user_id_d4253ffe_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_redactor
    ADD CONSTRAINT users_redactor_user_id_d4253ffe_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3750 (class 2606 OID 41371)
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3749 (class 2606 OID 41366)
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3752 (class 2606 OID 41385)
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3751 (class 2606 OID 41380)
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3774 (class 2606 OID 41640)
-- Name: videosHomePage_commentthematicvideo videosHomePage_comme_mobileuserid_id_4f9a0d2a_fk_users_mob; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public."videosHomePage_commentthematicvideo"
    ADD CONSTRAINT "videosHomePage_comme_mobileuserid_id_4f9a0d2a_fk_users_mob" FOREIGN KEY (mobileuserid_id) REFERENCES public.users_mobileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3775 (class 2606 OID 41645)
-- Name: videosHomePage_commentthematicvideo videosHomePage_comme_thematicVideoid_id_88fec3dc_fk_videosHom; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public."videosHomePage_commentthematicvideo"
    ADD CONSTRAINT "videosHomePage_comme_thematicVideoid_id_88fec3dc_fk_videosHom" FOREIGN KEY ("thematicVideoid_id") REFERENCES public."videosHomePage_thematicvideo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3772 (class 2606 OID 41628)
-- Name: videosHomePage_thematicvideo videosHomePage_thema_mobileuserid_id_989449aa_fk_users_mob; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public."videosHomePage_thematicvideo"
    ADD CONSTRAINT "videosHomePage_thema_mobileuserid_id_989449aa_fk_users_mob" FOREIGN KEY (mobileuserid_id) REFERENCES public.users_mobileuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3773 (class 2606 OID 41633)
-- Name: videosHomePage_thematicvideo videosHomePage_thema_moderatorid_id_2ab5bf78_fk_users_mod; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public."videosHomePage_thematicvideo"
    ADD CONSTRAINT "videosHomePage_thema_moderatorid_id_2ab5bf78_fk_users_mod" FOREIGN KEY (moderatorid_id) REFERENCES public.users_moderator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3971 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE countries; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.countries TO django;


--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 197
-- Name: SEQUENCE countries_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.countries_id_seq TO django;


--
-- TOC entry 3981 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE regions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.regions TO django;


--
-- TOC entry 3983 (class 0 OID 0)
-- Dependencies: 199
-- Name: SEQUENCE regionsv3_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.regionsv3_id_seq TO django;


-- Completed on 2020-03-12 23:00:14 CET

--
-- PostgreSQL database dump complete
--

