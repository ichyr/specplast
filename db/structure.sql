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
-- Name: bootsy_image_galleries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bootsy_image_galleries (
    id integer NOT NULL,
    bootsy_resource_id integer,
    bootsy_resource_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bootsy_image_galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bootsy_image_galleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bootsy_image_galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bootsy_image_galleries_id_seq OWNED BY bootsy_image_galleries.id;


--
-- Name: bootsy_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bootsy_images (
    id integer NOT NULL,
    image_file character varying,
    image_gallery_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bootsy_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bootsy_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bootsy_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bootsy_images_id_seq OWNED BY bootsy_images.id;


--
-- Name: general_infos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE general_infos (
    id integer NOT NULL,
    key text,
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: general_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE general_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: general_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE general_infos_id_seq OWNED BY general_infos.id;


--
-- Name: qualifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE qualifications (
    id integer NOT NULL,
    user_id integer,
    vmilist_id integer,
    confirmed integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE qualifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE qualifications_id_seq OWNED BY qualifications.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
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
    file character varying
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
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar character varying
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
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    role integer,
    specialization_id integer,
    avatar character varying,
    city character varying,
    region character varying,
    description text,
    documents json
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
    name character varying,
    child_info text,
    instructor_info text,
    specialization_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar character varying
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

ALTER TABLE ONLY bootsy_image_galleries ALTER COLUMN id SET DEFAULT nextval('bootsy_image_galleries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bootsy_images ALTER COLUMN id SET DEFAULT nextval('bootsy_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY general_infos ALTER COLUMN id SET DEFAULT nextval('general_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY qualifications ALTER COLUMN id SET DEFAULT nextval('qualifications_id_seq'::regclass);


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
-- Name: bootsy_image_galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bootsy_image_galleries
    ADD CONSTRAINT bootsy_image_galleries_pkey PRIMARY KEY (id);


--
-- Name: bootsy_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bootsy_images
    ADD CONSTRAINT bootsy_images_pkey PRIMARY KEY (id);


--
-- Name: general_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY general_infos
    ADD CONSTRAINT general_infos_pkey PRIMARY KEY (id);


--
-- Name: qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY qualifications
    ADD CONSTRAINT qualifications_pkey PRIMARY KEY (id);


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

INSERT INTO schema_migrations (version) VALUES ('20141014101441');

INSERT INTO schema_migrations (version) VALUES ('20141103160759');

INSERT INTO schema_migrations (version) VALUES ('20141103160760');

INSERT INTO schema_migrations (version) VALUES ('20141106162220');

INSERT INTO schema_migrations (version) VALUES ('20141210222059');

INSERT INTO schema_migrations (version) VALUES ('20141224162619');

INSERT INTO schema_migrations (version) VALUES ('20150119225402');

