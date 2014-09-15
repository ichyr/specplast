--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: specdata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE specdata (
    id integer NOT NULL,
    gen_info text,
    proby text,
    activity text,
    provid text,
    specialization_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    file character varying(255)
);


--
-- Name: specdata_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE specdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: specdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE specdata_id_seq OWNED BY specdata.id;


--
-- Name: specializations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE specializations (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar character varying(255)
);


--
-- Name: specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE specializations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: specializations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE specializations_id_seq OWNED BY specializations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    role integer,
    specialization_id integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vmilists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vmilists (
    id integer NOT NULL,
    name character varying(255),
    child_info text,
    instructor_info text,
    specialization_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar character varying(255)
);


--
-- Name: vmilists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vmilists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vmilists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vmilists_id_seq OWNED BY vmilists.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY specdata ALTER COLUMN id SET DEFAULT nextval('specdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY specializations ALTER COLUMN id SET DEFAULT nextval('specializations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vmilists ALTER COLUMN id SET DEFAULT nextval('vmilists_id_seq'::regclass);


--
-- Name: specdata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY specdata
    ADD CONSTRAINT specdata_pkey PRIMARY KEY (id);


--
-- Name: specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vmilists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vmilists
    ADD CONSTRAINT vmilists_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140909072738');

INSERT INTO schema_migrations (version) VALUES ('20140909072742');

INSERT INTO schema_migrations (version) VALUES ('20140909072751');

INSERT INTO schema_migrations (version) VALUES ('20140909075823');

INSERT INTO schema_migrations (version) VALUES ('20140909080515');

INSERT INTO schema_migrations (version) VALUES ('20140909194407');

INSERT INTO schema_migrations (version) VALUES ('20140909195331');

INSERT INTO schema_migrations (version) VALUES ('20140910084337');

INSERT INTO schema_migrations (version) VALUES ('20140911103130');

INSERT INTO schema_migrations (version) VALUES ('20140911103246');
