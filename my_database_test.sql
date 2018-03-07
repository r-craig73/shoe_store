--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ronc
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO ronc;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ronc
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO ronc;

--
-- Name: shoes; Type: TABLE; Schema: public; Owner: ronc
--

CREATE TABLE shoes (
    id bigint NOT NULL,
    brand character varying,
    price numeric(5,2)
);


ALTER TABLE shoes OWNER TO ronc;

--
-- Name: shoes_id_seq; Type: SEQUENCE; Schema: public; Owner: ronc
--

CREATE SEQUENCE shoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shoes_id_seq OWNER TO ronc;

--
-- Name: shoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ronc
--

ALTER SEQUENCE shoes_id_seq OWNED BY shoes.id;


--
-- Name: shoes_stores; Type: TABLE; Schema: public; Owner: ronc
--

CREATE TABLE shoes_stores (
    id bigint NOT NULL,
    shoe_id integer,
    store_id integer
);


ALTER TABLE shoes_stores OWNER TO ronc;

--
-- Name: shoes_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: ronc
--

CREATE SEQUENCE shoes_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shoes_stores_id_seq OWNER TO ronc;

--
-- Name: shoes_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ronc
--

ALTER SEQUENCE shoes_stores_id_seq OWNED BY shoes_stores.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: ronc
--

CREATE TABLE stores (
    id bigint NOT NULL,
    name character varying
);


ALTER TABLE stores OWNER TO ronc;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: ronc
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stores_id_seq OWNER TO ronc;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ronc
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: shoes id; Type: DEFAULT; Schema: public; Owner: ronc
--

ALTER TABLE ONLY shoes ALTER COLUMN id SET DEFAULT nextval('shoes_id_seq'::regclass);


--
-- Name: shoes_stores id; Type: DEFAULT; Schema: public; Owner: ronc
--

ALTER TABLE ONLY shoes_stores ALTER COLUMN id SET DEFAULT nextval('shoes_stores_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: ronc
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ronc
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	test	2018-03-05 08:34:00.547144	2018-03-05 08:34:00.550223
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ronc
--

COPY schema_migrations (version) FROM stdin;
20180305073552
20180305022833
20180305022513
\.


--
-- Data for Name: shoes; Type: TABLE DATA; Schema: public; Owner: ronc
--

COPY shoes (id, brand, price) FROM stdin;
\.


--
-- Data for Name: shoes_stores; Type: TABLE DATA; Schema: public; Owner: ronc
--

COPY shoes_stores (id, shoe_id, store_id) FROM stdin;
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: ronc
--

COPY stores (id, name) FROM stdin;
\.


--
-- Name: shoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ronc
--

SELECT pg_catalog.setval('shoes_id_seq', 33, true);


--
-- Name: shoes_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ronc
--

SELECT pg_catalog.setval('shoes_stores_id_seq', 1, false);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ronc
--

SELECT pg_catalog.setval('stores_id_seq', 36, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ronc
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ronc
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shoes shoes_pkey; Type: CONSTRAINT; Schema: public; Owner: ronc
--

ALTER TABLE ONLY shoes
    ADD CONSTRAINT shoes_pkey PRIMARY KEY (id);


--
-- Name: shoes_stores shoes_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: ronc
--

ALTER TABLE ONLY shoes_stores
    ADD CONSTRAINT shoes_stores_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: ronc
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

