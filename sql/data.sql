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

--
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: bankwiz_user
--

COPY public.user_account (user_account_id, auth_id, email) FROM stdin;
\.


--
-- Data for Name: bank_account; Type: TABLE DATA; Schema: public; Owner: bankwiz_user
--

COPY public.bank_account (scale_base_amount, bank_account_id, user_account_id, bank_account_name, currency_iso_code) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

