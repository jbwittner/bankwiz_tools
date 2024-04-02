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

ALTER TABLE ONLY public.bank_account DROP CONSTRAINT fk_user_bankaccount;
ALTER TABLE ONLY public.user_account DROP CONSTRAINT user_account_pkey;
ALTER TABLE ONLY public.bank_account DROP CONSTRAINT bank_account_pkey;
DROP TABLE public.user_account;
DROP TABLE public.bank_account;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bank_account; Type: TABLE; Schema: public; Owner: bankwiz_user
--

CREATE TABLE public.bank_account (
    scale_base_amount integer NOT NULL,
    bank_account_id uuid NOT NULL,
    user_account_id uuid NOT NULL,
    bank_account_name character varying(255) NOT NULL,
    currency_iso_code character varying(255) NOT NULL
);


ALTER TABLE public.bank_account OWNER TO bankwiz_user;

--
-- Name: user_account; Type: TABLE; Schema: public; Owner: bankwiz_user
--

CREATE TABLE public.user_account (
    user_account_id uuid NOT NULL,
    auth_id character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.user_account OWNER TO bankwiz_user;

--
-- Name: bank_account bank_account_pkey; Type: CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_pkey PRIMARY KEY (bank_account_id);


--
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (user_account_id);


--
-- Name: bank_account fk_user_bankaccount; Type: FK CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT fk_user_bankaccount FOREIGN KEY (user_account_id) REFERENCES public.user_account(user_account_id);


--
-- PostgreSQL database dump complete
--

