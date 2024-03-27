--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

ALTER TABLE ONLY public.user_account DROP CONSTRAINT user_account_pkey;
DROP TABLE public.user_account;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: user_account; Type: TABLE; Schema: public; Owner: bankwiz_user
--

CREATE TABLE public.user_account (
    id uuid NOT NULL,
    auth_id character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.user_account OWNER TO bankwiz_user;

--
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

