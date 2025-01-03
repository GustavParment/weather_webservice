--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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

--
-- Name: app_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_user_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    description character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    updated_at timestamp(6) without time zone,
    CONSTRAINT roles_name_check CHECK (((name)::text = ANY ((ARRAY['USER'::character varying, 'ADMIN'::character varying, 'SUPER_ADMIN'::character varying])::text[])))
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_seq OWNER TO postgres;

--
-- Name: user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    email character varying(100) NOT NULL,
    full_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    updated_at timestamp(6) without time zone,
    role_id bigint NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_seq OWNER TO postgres;

--
-- Name: weather_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather_data (
    id bigint NOT NULL,
    city_name character varying(255) NOT NULL,
    cloud integer NOT NULL,
    country_code character varying(255) NOT NULL,
    datetime character varying(255) NOT NULL,
    lat double precision NOT NULL,
    lon double precision NOT NULL,
    max_temp double precision,
    min_temp double precision,
    state_code character varying(255),
    temp double precision NOT NULL,
    timezone character varying(255) NOT NULL,
    weather_description character varying(255),
    icon character varying(255)
);


ALTER TABLE public.weather_data OWNER TO postgres;

--
-- Name: weather_data_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weather_data_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weather_data_seq OWNER TO postgres;

--
-- Name: weather_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weather_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weather_seq OWNER TO postgres;

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, created_at, description, name, updated_at) FROM stdin;
1	2024-11-11 16:35:51.003	Default user role	USER	2024-11-11 16:35:51.003
2	2024-11-11 16:35:51.029	Administrator role	ADMIN	2024-11-11 16:35:51.029
3	2024-11-11 16:35:51.034	Super Administrator role	SUPER_ADMIN	2024-11-11 16:35:51.034
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, email, full_name, password, updated_at, role_id) FROM stdin;
752	2024-11-20 11:44:19.978	Super Admin	Super Admin	$2a$10$exaMbfaZmpdTiaUKq83xOu2SGQStyGfzr3q2o.6FO60Mzlbitz.8e	2024-11-20 11:44:19.978	3
\.


--
-- Data for Name: weather_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather_data (id, city_name, cloud, country_code, datetime, lat, lon, max_temp, min_temp, state_code, temp, timezone, weather_description, icon) FROM stdin;
2604	TOKYO	40	JP	2024-11-17	35.6895	139.69171	21.8	16.1	40	18.9	Asia/Tokyo	Scattered clouds	\N
2605	LONDON	79	GB	2024-11-17	51.51279	-0.09184	8.8	5.4	ENG	7	Europe/London	Light shower rain	\N
2652	MALAGA	52	ES	2024-11-17	36.72016	-4.42034	21	14.6	51	17.5	Europe/Madrid	Broken clouds	\N
2653	BOGOTA	47	CO	2024-11-17	4.60971	-74.08175	16.1	9.1	34	12.3	America/Bogota	Light shower rain	\N
2702	HUSTON	90	US	2024-11-17	43.61016	-116.7832	6.1	0.4	ID	3.1	America/Boise	Mix snow/rain	\N
2752	TULLINGE	35	SE	2024-11-17	59.2	17.9	6.6	2.5	26	4.9	Europe/Stockholm	Scattered clouds	\N
2753	GDANSK	81	PL	2024-11-17	54.35205	18.64637	7.5	5.5	82	6.3	Europe/Warsaw	Overcast clouds	\N
2754	LILJEHOLMEN	23	US	2024-11-17	43.9633	-91.25625	11.7	2.6	WI	7.5	America/Chicago	Scattered clouds	\N
2755	V├äSTER├àS	27	SE	2024-11-17	59.61617	16.55276	6.2	3.5	25	4.8	Europe/Stockholm	Scattered clouds	\N
2756	CALI	60	CO	2024-11-17	3.43722	-76.5225	28	19.5	29	22.9	America/Bogota	Broken clouds	\N
2757	LOS ANGELES	6	US	2024-11-17	34.05223	-118.24368	21.1	6.8	CA	13.1	America/Los_Angeles	Few clouds	\N
2802	SAN DIEGO	6	US	2024-11-17	32.71533	-117.15726	18.7	6.9	CA	12.7	America/Los_Angeles	Few clouds	\N
2803	S├ûDERMALM	32	SE	2024-11-17	61.30373	17.05921	3.9	0	03	2.3	Europe/Stockholm	Mix snow/rain	\N
2804	V├äSTERTORP	24	SE	2024-11-17	59.61617	16.55276	6.4	3.2	25	4.7	Europe/Stockholm	Scattered clouds	\N
2805	MEDELLIN	64	CO	2024-11-17	6.25184	-75.56359	25.9	14	02	19	America/Bogota	Light rain	\N
2806	FUNGIROLA	54	ES	2024-11-17	36.53998	-4.62473	20.7	15.8	51	18	Europe/Madrid	Broken clouds	\N
2852	MARBELLA	59	ES	2024-11-17	36.51543	-4.88583	20.4	16.8	51	18.4	Europe/Madrid	Broken clouds	\N
2853	CAPETOWN	75	US	2024-11-17	40.46624	-124.36728	13.6	8.3	CA	11.1	America/Los_Angeles	Moderate rain	\N
2854	ST PETERS BURG	38	RU	2024-11-17	59.93863	30.31413	6.5	4.6	66	5.7	Europe/Moscow	Scattered clouds	\N
2855	COPENHAGEN	53	DK	2024-11-17	55.67594	12.56553	7.5	5.5	17	6.5	Europe/Copenhagen	Broken clouds	\N
2856	SK├äRHOLMEN	23	SE	2024-11-17	59.36667	17.2	6.8	2.9	18	5.1	Europe/Stockholm	Scattered clouds	\N
2857	GR├ûNDAL	0	IN	2024-11-17	21.96074	70.80255	33.1	18.2	09	25.7	Asia/Kolkata	Clear Sky	\N
2902	LONG ISLAND	12	US	2024-11-17	43.68425	-70.17116	14.1	4	ME	8.2	America/New_York	Few clouds	c02d
2602	STOCKHOLM	100	SE	2024-11-20	59.33258	18.0649	6.5	3.3	26	0	Europe/Stockholm	Scattered clouds	\N
2603	NEW YORK	73	US	2024-11-20	40.71427	-74.00597	16.2	7.7	NY	12.7	America/New_York	Scattered clouds	\N
\.


--
-- Name: app_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_seq', 501, true);


--
-- Name: roles_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_seq', 51, true);


--
-- Name: user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_seq', 51, true);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_seq', 801, true);


--
-- Name: weather_data_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weather_data_seq', 2951, true);


--
-- Name: weather_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weather_seq', 2001, true);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: roles ukofx66keruapi6vyqpv6f2or37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT ukofx66keruapi6vyqpv6f2or37 UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: weather_data weather_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT weather_data_pkey PRIMARY KEY (id);


--
-- Name: users fkp56c1712k691lhsyewcssf40f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkp56c1712k691lhsyewcssf40f FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

