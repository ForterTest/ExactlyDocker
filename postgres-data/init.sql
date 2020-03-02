--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO exactly;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: exactly
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO exactly;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exactly
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO exactly;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: exactly
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO exactly;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exactly
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id bigint NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO exactly;

--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id bigint NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO exactly;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.oauth_clients (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100),
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO exactly;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: exactly
--

CREATE SEQUENCE public.oauth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_clients_id_seq OWNER TO exactly;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exactly
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.oauth_personal_access_clients (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO exactly;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: exactly
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO exactly;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exactly
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO exactly;

--
-- Name: operations; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.operations (
    id bigint NOT NULL,
    source_user_id bigint NOT NULL,
    target_user_id bigint,
    amount integer NOT NULL,
    source_new_balance integer NOT NULL,
    target_new_balance integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.operations OWNER TO exactly;

--
-- Name: COLUMN operations.amount; Type: COMMENT; Schema: public; Owner: exactly
--

COMMENT ON COLUMN public.operations.amount IS 'Operation amount in major units';


--
-- Name: COLUMN operations.source_new_balance; Type: COMMENT; Schema: public; Owner: exactly
--

COMMENT ON COLUMN public.operations.source_new_balance IS 'Source user balance after operation';


--
-- Name: COLUMN operations.target_new_balance; Type: COMMENT; Schema: public; Owner: exactly
--

COMMENT ON COLUMN public.operations.target_new_balance IS 'Target user balance after operation';


--
-- Name: operations_id_seq; Type: SEQUENCE; Schema: public; Owner: exactly
--

CREATE SEQUENCE public.operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operations_id_seq OWNER TO exactly;

--
-- Name: operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exactly
--

ALTER SEQUENCE public.operations_id_seq OWNED BY public.operations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO exactly;

--
-- Name: users; Type: TABLE; Schema: public; Owner: exactly; Tablespace: 
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    balance integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO exactly;

--
-- Name: COLUMN users.balance; Type: COMMENT; Schema: public; Owner: exactly
--

COMMENT ON COLUMN public.users.balance IS 'Balance in major units';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: exactly
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO exactly;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exactly
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exactly
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exactly
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exactly
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exactly
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exactly
--

ALTER TABLE ONLY public.operations ALTER COLUMN id SET DEFAULT nextval('public.operations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exactly
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exactly
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2016_06_01_000001_create_oauth_auth_codes_table	1
4	2016_06_01_000002_create_oauth_access_tokens_table	1
5	2016_06_01_000003_create_oauth_refresh_tokens_table	1
6	2016_06_01_000004_create_oauth_clients_table	1
7	2016_06_01_000005_create_oauth_personal_access_clients_table	1
8	2019_08_19_000000_create_failed_jobs_table	1
9	2020_02_23_163638_create_operations_table	1
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exactly
--

SELECT pg_catalog.setval('public.migrations_id_seq', 9, true);


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
df73c329bf058b785668e45dd56b46d8cf14cd6babe74f75f577ff185772aa1d9782addde57db84b	1	3	\N	[]	f	2020-03-01 23:01:48	2020-03-01 23:01:48	2021-03-01 23:01:48
7b34c2140b70de965f2676759e8f575fab1f365e0abf7f1d62e52941ba4973af77e2092b0d3a3faf	5	3	\N	[]	f	2020-03-01 23:01:52	2020-03-01 23:01:52	2021-03-01 23:01:52
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
702fcac62d75b52827022018a5f12fab12da2747c0e8a8c12764cb4f1c03e3492d39bb9fe3d8d04e	1	3	[]	t	2020-03-01 23:11:48
19425bdfff52966f986de1511aa29c6b2fadb728f78eecaa9ca0cf2951fadb731e9c926f621f03ba	5	3	[]	t	2020-03-01 23:11:52
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.oauth_clients (id, user_id, name, secret, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	Exactly Personal Access Client	MOjTUoUKxtyEHArp5zZbVtdOHm0lCig6J82Jnsq5	http://localhost	t	f	f	2020-03-01 23:00:38	2020-03-01 23:00:38
2	\N	Exactly Password Grant Client	okGVZSRXj76lGHHJKTF3rFyzeFlsOnTFjjYkIzmg	http://localhost	f	t	f	2020-03-01 23:00:38	2020-03-01 23:00:38
3	1	Test service	ExkhLeQDrAMmX2f1rbzV0CGrh8yclhGCH7eC0waR	http://127.0.0.1:88/callback.php	f	f	f	2020-03-01 23:00:56	2020-03-01 23:00:56
\.


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exactly
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 3, true);


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	1	2020-03-01 23:00:38	2020-03-01 23:00:38
\.


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exactly
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 1, true);


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
6c810664e6802cbfd8d258523ff0a3551edda76c5ccf08d746ab2d2d45ff32fa58f8ec3c820d9c3e	df73c329bf058b785668e45dd56b46d8cf14cd6babe74f75f577ff185772aa1d9782addde57db84b	f	2021-03-01 23:01:48
5775e2fdd9aaf7713e2f26c7a081aa13ccb4bb2673ab06b1144ae9be960d6382bc98c4490e2dbde4	7b34c2140b70de965f2676759e8f575fab1f365e0abf7f1d62e52941ba4973af77e2092b0d3a3faf	f	2021-03-01 23:01:52
\.


--
-- Data for Name: operations; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.operations (id, source_user_id, target_user_id, amount, source_new_balance, target_new_balance, created_at, updated_at) FROM stdin;
1	1	5	12054	537946	12054	2020-03-01 23:03:42	2020-03-01 23:03:42
2	1	2	1580	536366	1580	2020-03-01 23:04:37	2020-03-01 23:04:37
3	1	3	6144	530222	6144	2020-03-01 23:04:37	2020-03-01 23:04:37
4	5	1	4421	7633	534643	2020-03-01 23:04:55	2020-03-01 23:04:55
5	1	7	1100	533543	1100	2020-03-01 23:05:04	2020-03-01 23:05:04
\.


--
-- Name: operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exactly
--

SELECT pg_catalog.setval('public.operations_id_seq', 33, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: exactly
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, balance, created_at, updated_at, deleted_at) FROM stdin;
4	Larissa Crooks	carolyne.olson@example.com	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	RnFpxKZNKB	0	2020-03-01 22:58:13	2020-03-01 22:58:13	\N
6	Dr. Afton Schoen	dwilliamson@example.org	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	BHF0TMJsEd	0	2020-03-01 22:58:13	2020-03-01 22:58:13	\N
8	Lambert Kub Sr.	conroy.jadon@example.org	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	Pm0OnjnBUd	0	2020-03-01 22:58:13	2020-03-01 22:58:13	\N
9	Bonita Bernhard	damian25@example.org	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	5iodjfsUEu	0	2020-03-01 22:58:13	2020-03-01 22:58:13	\N
10	Aylin McCullough	eliane79@example.net	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	mvGuFS9BcH	0	2020-03-01 22:58:13	2020-03-01 22:58:13	\N
2	Else Kub	sadye01@example.org	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	1gVQu1Rwdq	1580	2020-03-01 22:58:13	2020-03-01 23:04:37	\N
3	Bennett Swift	maverick.howe@example.com	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	1Y4fl1Sx7h	6144	2020-03-01 22:58:13	2020-03-01 23:04:37	\N
5	Joan Jaskolski	jailyn.schaden@example.com	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	TqfSOvIthd	7633	2020-03-01 22:58:13	2020-03-01 23:04:55	\N
1	Dr. Melody Smith V	lourdes44@example.org	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	6VrxtpC5aL	533543	2020-03-01 22:58:13	2020-03-01 23:05:04	\N
7	Allen Bosco I	fannie03@example.net	2020-03-01 22:58:13	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi	jvfhtrp5KG	1100	2020-03-01 22:58:13	2020-03-01 23:05:04	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exactly
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: operations_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (id);


--
-- Name: users_email_unique; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: exactly; Tablespace: 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: exactly; Tablespace: 
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- Name: oauth_auth_codes_user_id_index; Type: INDEX; Schema: public; Owner: exactly; Tablespace: 
--

CREATE INDEX oauth_auth_codes_user_id_index ON public.oauth_auth_codes USING btree (user_id);


--
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: exactly; Tablespace: 
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


--
-- Name: operations_created_at_index; Type: INDEX; Schema: public; Owner: exactly; Tablespace: 
--

CREATE INDEX operations_created_at_index ON public.operations USING btree (created_at);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: exactly; Tablespace: 
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: source_user; Type: INDEX; Schema: public; Owner: exactly; Tablespace: 
--

CREATE INDEX source_user ON public.operations USING btree (source_user_id);


--
-- Name: target_user; Type: INDEX; Schema: public; Owner: exactly; Tablespace: 
--

CREATE INDEX target_user ON public.operations USING btree (target_user_id);


--
-- Name: operations_source_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: exactly
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_source_user_id_foreign FOREIGN KEY (source_user_id) REFERENCES public.users(id);


--
-- Name: operations_target_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: exactly
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_target_user_id_foreign FOREIGN KEY (target_user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: exactly
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM exactly;
GRANT ALL ON SCHEMA public TO exactly;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

