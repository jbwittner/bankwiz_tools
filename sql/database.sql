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

ALTER TABLE ONLY public.bank_accounts DROP CONSTRAINT fk_user_bankaccount;
ALTER TABLE ONLY public.transactions DROP CONSTRAINT fk_bankaccount_transaction;
ALTER TABLE ONLY public.user_accounts DROP CONSTRAINT user_accounts_pkey;
ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
ALTER TABLE ONLY public.bank_accounts DROP CONSTRAINT bank_accounts_pkey;
DROP TABLE public.user_accounts;
DROP TABLE public.transactions;
DROP TABLE public.bank_accounts;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: bankwiz_user
--

CREATE TABLE public.bank_accounts (
    scale_base_amount integer NOT NULL,
    bank_account_id uuid NOT NULL,
    user_account_id uuid NOT NULL,
    bank_account_name character varying(255) NOT NULL,
    currency_iso_code character varying(255) NOT NULL
);


ALTER TABLE public.bank_accounts OWNER TO bankwiz_user;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: bankwiz_user
--

CREATE TABLE public.transactions (
    scale_amount integer NOT NULL,
    bank_account_id uuid NOT NULL,
    transaction_id uuid NOT NULL,
    comment character varying(100)
);


ALTER TABLE public.transactions OWNER TO bankwiz_user;

--
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: bankwiz_user
--

CREATE TABLE public.user_accounts (
    user_account_id uuid NOT NULL,
    auth_id character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.user_accounts OWNER TO bankwiz_user;

--
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (bank_account_id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- Name: user_accounts user_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_pkey PRIMARY KEY (user_account_id);


--
-- Name: transactions fk_bankaccount_transaction; Type: FK CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_bankaccount_transaction FOREIGN KEY (bank_account_id) REFERENCES public.bank_accounts(bank_account_id);


--
-- Name: bank_accounts fk_user_bankaccount; Type: FK CONSTRAINT; Schema: public; Owner: bankwiz_user
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT fk_user_bankaccount FOREIGN KEY (user_account_id) REFERENCES public.user_accounts(user_account_id);


--
-- PostgreSQL database dump complete
--

