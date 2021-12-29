--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO test_ecommerce;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO test_ecommerce;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO test_ecommerce;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO test_ecommerce;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO test_ecommerce;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO test_ecommerce;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO test_ecommerce;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO test_ecommerce;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO test_ecommerce;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO test_ecommerce;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO test_ecommerce;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO test_ecommerce;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO test_ecommerce;

--
-- Name: shop_api_customuser; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.shop_api_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    user_name character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.shop_api_customuser OWNER TO test_ecommerce;

--
-- Name: shop_api_customuser_groups; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.shop_api_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.shop_api_customuser_groups OWNER TO test_ecommerce;

--
-- Name: shop_api_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.shop_api_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_api_customuser_groups_id_seq OWNER TO test_ecommerce;

--
-- Name: shop_api_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.shop_api_customuser_groups_id_seq OWNED BY public.shop_api_customuser_groups.id;


--
-- Name: shop_api_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.shop_api_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_api_customuser_id_seq OWNER TO test_ecommerce;

--
-- Name: shop_api_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.shop_api_customuser_id_seq OWNED BY public.shop_api_customuser.id;


--
-- Name: shop_api_customuser_user_permissions; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.shop_api_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.shop_api_customuser_user_permissions OWNER TO test_ecommerce;

--
-- Name: shop_api_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.shop_api_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_api_customuser_user_permissions_id_seq OWNER TO test_ecommerce;

--
-- Name: shop_api_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.shop_api_customuser_user_permissions_id_seq OWNED BY public.shop_api_customuser_user_permissions.id;


--
-- Name: shop_api_product; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.shop_api_product (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    size character varying(4) NOT NULL,
    color character varying(20) NOT NULL,
    category_id bigint NOT NULL,
    creator_id bigint NOT NULL,
    shop_inf_id bigint NOT NULL,
    CONSTRAINT shop_api_product_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.shop_api_product OWNER TO test_ecommerce;

--
-- Name: shop_api_product_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.shop_api_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_api_product_id_seq OWNER TO test_ecommerce;

--
-- Name: shop_api_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.shop_api_product_id_seq OWNED BY public.shop_api_product.id;


--
-- Name: shop_api_productcategory; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.shop_api_productcategory (
    id bigint NOT NULL,
    category character varying(20) NOT NULL
);


ALTER TABLE public.shop_api_productcategory OWNER TO test_ecommerce;

--
-- Name: shop_api_productcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.shop_api_productcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_api_productcategory_id_seq OWNER TO test_ecommerce;

--
-- Name: shop_api_productcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.shop_api_productcategory_id_seq OWNED BY public.shop_api_productcategory.id;


--
-- Name: shop_api_shop; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.shop_api_shop (
    id bigint NOT NULL,
    shop_info_id bigint NOT NULL
);


ALTER TABLE public.shop_api_shop OWNER TO test_ecommerce;

--
-- Name: shop_api_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.shop_api_shop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_api_shop_id_seq OWNER TO test_ecommerce;

--
-- Name: shop_api_shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.shop_api_shop_id_seq OWNED BY public.shop_api_shop.id;


--
-- Name: shop_api_shop_products; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.shop_api_shop_products (
    id bigint NOT NULL,
    shop_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.shop_api_shop_products OWNER TO test_ecommerce;

--
-- Name: shop_api_shop_products_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.shop_api_shop_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_api_shop_products_id_seq OWNER TO test_ecommerce;

--
-- Name: shop_api_shop_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.shop_api_shop_products_id_seq OWNED BY public.shop_api_shop_products.id;


--
-- Name: shop_api_shopinfo; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.shop_api_shopinfo (
    id bigint NOT NULL,
    shop_name character varying(50) NOT NULL,
    owner_id bigint NOT NULL
);


ALTER TABLE public.shop_api_shopinfo OWNER TO test_ecommerce;

--
-- Name: shop_api_shopinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.shop_api_shopinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_api_shopinfo_id_seq OWNER TO test_ecommerce;

--
-- Name: shop_api_shopinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.shop_api_shopinfo_id_seq OWNED BY public.shop_api_shopinfo.id;


--
-- Name: token_blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.token_blacklist_blacklistedtoken (
    id bigint NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id bigint NOT NULL
);


ALTER TABLE public.token_blacklist_blacklistedtoken OWNER TO test_ecommerce;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.token_blacklist_blacklistedtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.token_blacklist_blacklistedtoken_id_seq OWNER TO test_ecommerce;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.token_blacklist_blacklistedtoken_id_seq OWNED BY public.token_blacklist_blacklistedtoken.id;


--
-- Name: token_blacklist_outstandingtoken; Type: TABLE; Schema: public; Owner: local_ecommerce
--

CREATE TABLE public.token_blacklist_outstandingtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id bigint,
    jti character varying(255) NOT NULL
);


ALTER TABLE public.token_blacklist_outstandingtoken OWNER TO test_ecommerce;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: local_ecommerce
--

CREATE SEQUENCE public.token_blacklist_outstandingtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.token_blacklist_outstandingtoken_id_seq OWNER TO test_ecommerce;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: local_ecommerce
--

ALTER SEQUENCE public.token_blacklist_outstandingtoken_id_seq OWNED BY public.token_blacklist_outstandingtoken.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: shop_api_customuser id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser ALTER COLUMN id SET DEFAULT nextval('public.shop_api_customuser_id_seq'::regclass);


--
-- Name: shop_api_customuser_groups id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.shop_api_customuser_groups_id_seq'::regclass);


--
-- Name: shop_api_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.shop_api_customuser_user_permissions_id_seq'::regclass);


--
-- Name: shop_api_product id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_product ALTER COLUMN id SET DEFAULT nextval('public.shop_api_product_id_seq'::regclass);


--
-- Name: shop_api_productcategory id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_productcategory ALTER COLUMN id SET DEFAULT nextval('public.shop_api_productcategory_id_seq'::regclass);


--
-- Name: shop_api_shop id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shop ALTER COLUMN id SET DEFAULT nextval('public.shop_api_shop_id_seq'::regclass);


--
-- Name: shop_api_shop_products id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shop_products ALTER COLUMN id SET DEFAULT nextval('public.shop_api_shop_products_id_seq'::regclass);


--
-- Name: shop_api_shopinfo id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shopinfo ALTER COLUMN id SET DEFAULT nextval('public.shop_api_shopinfo_id_seq'::regclass);


--
-- Name: token_blacklist_blacklistedtoken id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_blacklistedtoken_id_seq'::regclass);


--
-- Name: token_blacklist_outstandingtoken id; Type: DEFAULT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_outstandingtoken_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
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
21	Can add custom user	6	add_customuser
22	Can change custom user	6	change_customuser
23	Can delete custom user	6	delete_customuser
24	Can view custom user	6	view_customuser
25	Can add product	7	add_product
26	Can change product	7	change_product
27	Can delete product	7	delete_product
28	Can view product	7	view_product
29	Can add product category	8	add_productcategory
30	Can change product category	8	change_productcategory
31	Can delete product category	8	delete_productcategory
32	Can view product category	8	view_productcategory
33	Can add shop info	9	add_shopinfo
34	Can change shop info	9	change_shopinfo
35	Can delete shop info	9	delete_shopinfo
36	Can view shop info	9	view_shopinfo
37	Can add shop	10	add_shop
38	Can change shop	10	change_shop
39	Can delete shop	10	delete_shop
40	Can view shop	10	view_shop
41	Can add blacklisted token	11	add_blacklistedtoken
42	Can change blacklisted token	11	change_blacklistedtoken
43	Can delete blacklisted token	11	delete_blacklistedtoken
44	Can view blacklisted token	11	view_blacklistedtoken
45	Can add outstanding token	12	add_outstandingtoken
46	Can change outstanding token	12	change_outstandingtoken
47	Can delete outstanding token	12	delete_outstandingtoken
48	Can view outstanding token	12	view_outstandingtoken
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-12-29 16:12:09.179032+03	2	zara_brand	3		6	1
2	2021-12-29 16:29:53.057337+03	1	clothing	1	[{"added": {}}]	8	1
3	2021-12-29 16:29:56.374449+03	2	shoes	1	[{"added": {}}]	8	1
4	2021-12-29 16:29:59.341795+03	3	sport	1	[{"added": {}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	shop_api	customuser
7	shop_api	product
8	shop_api	productcategory
9	shop_api	shopinfo
10	shop_api	shop
11	token_blacklist	blacklistedtoken
12	token_blacklist	outstandingtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-12-29 16:07:47.319976+03
2	contenttypes	0002_remove_content_type_name	2021-12-29 16:07:47.328603+03
3	auth	0001_initial	2021-12-29 16:07:47.390406+03
4	auth	0002_alter_permission_name_max_length	2021-12-29 16:07:47.397492+03
5	auth	0003_alter_user_email_max_length	2021-12-29 16:07:47.41593+03
6	auth	0004_alter_user_username_opts	2021-12-29 16:07:47.430688+03
7	auth	0005_alter_user_last_login_null	2021-12-29 16:07:47.441405+03
8	auth	0006_require_contenttypes_0002	2021-12-29 16:07:47.445606+03
9	auth	0007_alter_validators_add_error_messages	2021-12-29 16:07:47.453315+03
10	auth	0008_alter_user_username_max_length	2021-12-29 16:07:47.46058+03
11	auth	0009_alter_user_last_name_max_length	2021-12-29 16:07:47.467906+03
12	auth	0010_alter_group_name_max_length	2021-12-29 16:07:47.476886+03
13	auth	0011_update_proxy_permissions	2021-12-29 16:07:47.484223+03
14	auth	0012_alter_user_first_name_max_length	2021-12-29 16:07:47.491576+03
15	shop_api	0001_initial	2021-12-29 16:07:47.704799+03
16	admin	0001_initial	2021-12-29 16:07:47.773039+03
17	admin	0002_logentry_remove_auto_add	2021-12-29 16:07:47.790684+03
18	admin	0003_logentry_add_action_flag_choices	2021-12-29 16:07:47.810885+03
19	sessions	0001_initial	2021-12-29 16:07:47.838812+03
20	shop_api	0002_alter_shopinfo_shop_name	2021-12-29 16:07:47.877089+03
21	token_blacklist	0001_initial	2021-12-29 16:07:47.942183+03
22	token_blacklist	0002_outstandingtoken_jti_hex	2021-12-29 16:07:47.973486+03
23	token_blacklist	0003_auto_20171017_2007	2021-12-29 16:07:47.992177+03
24	token_blacklist	0004_auto_20171017_2013	2021-12-29 16:07:48.021942+03
25	token_blacklist	0005_remove_outstandingtoken_jti	2021-12-29 16:07:48.034101+03
26	token_blacklist	0006_auto_20171017_2113	2021-12-29 16:07:48.04632+03
27	token_blacklist	0007_auto_20171017_2214	2021-12-29 16:07:48.073651+03
28	token_blacklist	0008_migrate_to_bigautofield	2021-12-29 16:07:48.158163+03
29	token_blacklist	0010_fix_migrate_to_bigautofield	2021-12-29 16:07:48.206091+03
30	token_blacklist	0011_linearizes_history	2021-12-29 16:07:48.210178+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
y6ch4e14wyrwjpieireqq7m1uetrvq8n	.eJxVjDEOwjAMRe-SGUUNdtOEkb1nqOzYIgWUSE07Ie4OlTrA-t97_2Um2tY8bU2XaRZzMc6cfjem9NCyA7lTuVWbalmXme2u2IM2O1bR5_Vw_w4ytfytQ596QiCOTjx3cSAQjdg5kTMgIwYdAjhxkoApMoLzQgmZVSKAN-8P5Do4Ig:1n2YhT:cdQBWqxLzq8lT38X5o-QZIgIgOCBssQNWMoNIGYJMSQ	2022-01-12 16:09:03.342842+03
\.


--
-- Data for Name: shop_api_customuser; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.shop_api_customuser (id, password, last_login, is_superuser, email, user_name, first_name, date_joined, is_staff, is_active) FROM stdin;
1	pbkdf2_sha256$260000$gTPExSBmvegJ2roN5KkNXE$7jvRm7/0H8APwDPkbdZkzTpzmUp27OnTo5KOAbfg248=	2021-12-29 16:09:03.336225+03	t	mike@gmail.com	mike		2021-12-29 16:08:38.280466+03	t	t
3	pbkdf2_sha256$260000$ZVwKZgGZMJtRsrHrLpKTwy$cHcDq9h0wLRGzULbfwzjOHfcKpKHAA77up7+s2LnFEM=	\N	f	zara_brand@gmail.com	zara_brand		2021-12-29 16:13:02.780333+03	f	t
4	pbkdf2_sha256$260000$OM8IEfHlcReu883JYMYG54$BvDHRltiPpktify+TAiDb8VS4mpqeEhHV1cD4o4hiAg=	\N	f	dc_shoes_shop@mail.com	dc_shoes		2021-12-29 17:14:36.670783+03	f	t
\.


--
-- Data for Name: shop_api_customuser_groups; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.shop_api_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: shop_api_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.shop_api_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: shop_api_product; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.shop_api_product (id, title, description, image, price, quantity, size, color, category_id, creator_id, shop_inf_id) FROM stdin;
1	ZARA black jacket	WOVEN JACKET MADE OF A SPUN COTTON BLEND. LONG SLEEVES. RIBBED TRIMS. ZIP-UP FRONT.	zara_jacket_black.png	24.99	1	m	black	1	3	1
2	Cotton and silk polo shirt	COLLARED POLO SHIRT MADE OF A SPUN COTTON AND SILK BLEND. FEATURING LONG SLEEVES.	red_jacket.png	30.00	1	l	yellow	1	3	1
3	Blue jeans zara	FADED RELAXED FIT CROPPED JEANS WITH FIVE POCKETS AND FRONT BUTTON FASTENING.	jeans.png	40.25	2	m	white	1	3	1
4	Slide sandals	POOL SANDALS. THICK RUBBER SOLE AND WIDE STRAP WITH TEXTURED GEOMETRIC DETAIL ACROSS	shoes.png	10.00	1	xs	black	2	3	1
5	Monochrome sneakers	SNEAKERS WITH MATCHING TOPSTITCHING DETAIL ON THE UPPER AND CONTRAST PIECE ON THE BACK.	white_sneakers.png	45.00	2	s	white	2	3	1
6	Double-brested suit blazer	BLAZER FEATURING A NOTCHED LAPEL COLLAR, LONG SLEEVES, PATCH POCKETS AT THE HIP, INSIDE	green_jacket.png	55.20	2	m	green	1	3	1
7	Dc city bag	FABRIC SHOULDER TOTE BAG. SOFT CONSTRUCTION IN TWO COLOURS. THE MAIN POCKET HAS MAGNETIC CLASP.	bag.png	24.00	1	s	white	3	4	2
8	Dc backpack	SOFT CONSTRUCTION BACKPACK IN A COMBINATION OF MUSTARD YELLOW, GREEN AND BLACK COLOURS.	backpack.png	40.00	1	m	yellow	3	4	2
9	Dc felt tote bag	FELT TOTE BAG. MAIN POCKET WITH TWO SMALL INSIDE POCKETS, ONE OF WHICH FASTENS WITH A ZIP.	green_tote_bag.png	20.00	1	s	green	3	4	2
10	Nylon black backpack	BACKPACK. SOFT DESIGN. AVAILABLE IN SEVERAL COLOURS. MAIN POCKET UNDER THE FLAP.	black_backpack.png	45.00	1	l	black	3	4	2
\.


--
-- Data for Name: shop_api_productcategory; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.shop_api_productcategory (id, category) FROM stdin;
1	clothing
2	shoes
3	sport
\.


--
-- Data for Name: shop_api_shop; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.shop_api_shop (id, shop_info_id) FROM stdin;
1	1
2	2
\.


--
-- Data for Name: shop_api_shop_products; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.shop_api_shop_products (id, shop_id, product_id) FROM stdin;
1	1	1
3	1	2
6	1	3
10	1	4
15	1	5
21	1	6
22	2	7
24	2	8
27	2	9
31	2	10
\.


--
-- Data for Name: shop_api_shopinfo; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.shop_api_shopinfo (id, shop_name, owner_id) FROM stdin;
1	zara	3
2	dc_shoes	4
\.


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
1	2021-12-29 16:45:45.663685+03	1
2	2021-12-29 16:45:45.733075+03	2
3	2021-12-29 16:45:45.844456+03	3
4	2021-12-29 16:45:45.916534+03	4
5	2021-12-29 16:45:46.019417+03	5
6	2021-12-29 16:45:46.160793+03	6
7	2021-12-29 16:45:46.224265+03	7
8	2021-12-29 16:45:46.311939+03	8
9	2021-12-29 16:45:46.427549+03	9
10	2021-12-29 16:45:46.492681+03	10
11	2021-12-29 16:45:46.624983+03	11
12	2021-12-29 16:45:46.744693+03	12
13	2021-12-29 16:45:46.81722+03	13
14	2021-12-29 16:45:46.938769+03	14
15	2021-12-29 16:45:47.036258+03	15
16	2021-12-29 16:45:47.085494+03	16
17	2021-12-29 16:45:47.225842+03	17
18	2021-12-29 16:45:47.316034+03	18
19	2021-12-29 16:45:47.353562+03	19
20	2021-12-29 16:45:47.43661+03	20
21	2021-12-29 16:45:47.51721+03	21
22	2021-12-29 16:45:47.554465+03	22
23	2021-12-29 16:45:47.639098+03	23
24	2021-12-29 16:45:47.738771+03	24
25	2021-12-29 16:45:47.799478+03	25
26	2021-12-29 16:45:47.901724+03	26
27	2021-12-29 16:45:48.005692+03	27
28	2021-12-29 16:45:48.063145+03	28
29	2021-12-29 16:45:48.150487+03	29
30	2021-12-29 16:45:48.238513+03	30
31	2021-12-29 16:45:48.29011+03	31
32	2021-12-29 16:45:48.384865+03	32
33	2021-12-29 16:45:48.49063+03	33
34	2021-12-29 16:45:48.5391+03	34
35	2021-12-29 16:45:48.634466+03	35
36	2021-12-29 16:45:48.74859+03	36
37	2021-12-29 16:45:48.813782+03	37
38	2021-12-29 16:45:48.935006+03	38
39	2021-12-29 16:45:49.041822+03	39
40	2021-12-29 16:45:49.081373+03	40
41	2021-12-29 16:45:49.205988+03	41
42	2021-12-29 16:45:49.332645+03	42
43	2021-12-29 16:45:49.397861+03	43
44	2021-12-29 16:45:49.540499+03	44
45	2021-12-29 16:45:49.634154+03	45
46	2021-12-29 16:45:49.68447+03	46
47	2021-12-29 16:45:49.819965+03	47
48	2021-12-29 16:45:49.935154+03	48
49	2021-12-29 17:13:58.718447+03	49
50	2021-12-29 17:37:43.780924+03	50
\.


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: local_ecommerce
--

COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
1	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg2OTk5NCwiaWF0IjoxNjQwNzgzNTk0LCJqdGkiOiI1NjJkY2FiZWZkZGE0Mzg0OTM1NzNiNDE3NTg5MTQ5ZiIsInVzZXJfaWQiOjN9.59WEfORLdGVZhqA2xWvfMIFm7uS76OA7xQSI_5GatOA	2021-12-29 16:13:14.942219+03	2021-12-30 16:13:14+03	3	562dcabefdda438493573b417589149f
2	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NSwiaWF0IjoxNjQwNzg1NTQ1LCJqdGkiOiIzYjZmODUxMTU5MzU0NTlmYjY5YjM3ZDBhY2IxNjczMSIsInVzZXJfaWQiOjN9.wd_XBpzEaE8W-19Z_yh6FcbU1pN9pRo6uT8h3VPqDe4	\N	2021-12-30 16:45:45+03	\N	3b6f85115935459fb69b37d0acb16731
3	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NSwiaWF0IjoxNjQwNzg1NTQ1LCJqdGkiOiJmYTRkZjVmZTY4Njk0OTlhODI4ZTU1NDg4NjNkNmZkNCIsInVzZXJfaWQiOjN9.jQwI0BOKJvOUDgjViREDYzxTef1nijyQfibWO_H-o4g	\N	2021-12-30 16:45:45+03	\N	fa4df5fe6869499a828e5548863d6fd4
4	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NSwiaWF0IjoxNjQwNzg1NTQ1LCJqdGkiOiJiZThkODYwNDFiNmU0OThlYTFjYjFmMGViYzg1NzU2YiIsInVzZXJfaWQiOjN9._2R4k_x8JpVSBVfVznmcy8WHWhKR3qWhEYOUZ6kQn74	\N	2021-12-30 16:45:45+03	\N	be8d86041b6e498ea1cb1f0ebc85756b
5	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NSwiaWF0IjoxNjQwNzg1NTQ1LCJqdGkiOiJiMDczMjgxOGVkMWQ0MzllYTU0Yjc2NjQwMzAwNjRlMyIsInVzZXJfaWQiOjN9.u6Y32mIGE-jCzfTw7rjm_i2etbUpOD1QJbrmIh6ymCs	\N	2021-12-30 16:45:45+03	\N	b0732818ed1d439ea54b7664030064e3
6	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NSwiaWF0IjoxNjQwNzg1NTQ1LCJqdGkiOiJiZjIwNmYxODY4ZDk0MTM4YTk3NTBjYTIzNjNjMWY2MyIsInVzZXJfaWQiOjN9.pnQLl-LfVnxbj0JBOo1miOnuFi0GUZhFNg4MmDt0hvc	\N	2021-12-30 16:45:45+03	\N	bf206f1868d94138a9750ca2363c1f63
7	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiI2Y2I0ZWM1MWU0YTE0ZjRjYTc4YzZiNmNmMTU2MGJiOCIsInVzZXJfaWQiOjN9.tm7U23Jqa9z7N1nd2_124SANa4nqCqAJxi7Pgnmc2qY	\N	2021-12-30 16:45:46+03	\N	6cb4ec51e4a14f4ca78c6b6cf1560bb8
8	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiJkMDM4OWNkOWJhYWE0N2FkYjQ1YTJhOTRkM2RlNGQ0MSIsInVzZXJfaWQiOjN9.DpW4YJiDLW9Qdf2nwPMXXOhKuTP-X9q-9Q-dOiiDbr0	\N	2021-12-30 16:45:46+03	\N	d0389cd9baaa47adb45a2a94d3de4d41
9	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiJiYjM1ZTQwY2M0OTQ0ZGE2OWU1MDYzZjNjYmE2MTA3MSIsInVzZXJfaWQiOjN9.Rns8ufxsXoZTYCdhQXEtnmC29MPOaj4XcOeFNYI6_Tg	\N	2021-12-30 16:45:46+03	\N	bb35e40cc4944da69e5063f3cba61071
10	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiI1Y2IxMTRlOGFlN2Q0Mzk3YWQxY2QzYmNmOGE3MWRiYSIsInVzZXJfaWQiOjN9.99bap9aQpA_JS-fhoiPml5WmaMLoGHgEynluVsh2YPA	\N	2021-12-30 16:45:46+03	\N	5cb114e8ae7d4397ad1cd3bcf8a71dba
11	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiJlMzFjM2VhOGFmN2M0YmRlYTI3Mzg1Y2YxZDgxZjhjZCIsInVzZXJfaWQiOjN9.KdfOJ6AFv9EzocpFKMQ6AJGhMIq1njgQ43UR1kwa0GU	\N	2021-12-30 16:45:46+03	\N	e31c3ea8af7c4bdea27385cf1d81f8cd
12	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiJjMTkzYWJhMmU3OTY0YzE1YTg4NjcxYmQ5YjFmMDI2YiIsInVzZXJfaWQiOjN9.uGefui0IL0d9d9sa5njguvJm-gqYlYYf0WT7X5PkYbM	\N	2021-12-30 16:45:46+03	\N	c193aba2e7964c15a88671bd9b1f026b
13	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiJhOTk5YWNmMjQ1M2Y0NDEyOWNhMzBiM2YwMjY1ODQ4OSIsInVzZXJfaWQiOjN9.dcRvgDPrI-Fn7YFM91eoFzoXEbIZi4VtXcD6z_sxdEo	\N	2021-12-30 16:45:46+03	\N	a999acf2453f44129ca30b3f02658489
14	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiJjNDZhNGY4ZGU4MGY0ODBiOWI3MjMyMTJmZGFiZDJlNSIsInVzZXJfaWQiOjN9.eyxCranH5rx1GeX99jgifmb-FkJowvLF7iZLKO652MM	\N	2021-12-30 16:45:46+03	\N	c46a4f8de80f480b9b723212fdabd2e5
15	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NiwiaWF0IjoxNjQwNzg1NTQ2LCJqdGkiOiI5OWQ3ZjU2Y2Q1Yzc0YjM1OTBmYTgxMzEyYzc0ZmZhYyIsInVzZXJfaWQiOjN9.QuwxY4fQKddAGbEfzZa0eliNk_QzRVEGGcL9APR6f04	\N	2021-12-30 16:45:46+03	\N	99d7f56cd5c74b3590fa81312c74ffac
16	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiIyZThmMThhMjgxM2Y0NjQzYWI5YzJkYzVjZmNjYWY4ZiIsInVzZXJfaWQiOjN9.znTk_B93PC3BN1lYKbO5fzjC54ao5wnsp9cJkHSKt8k	\N	2021-12-30 16:45:47+03	\N	2e8f18a2813f4643ab9c2dc5cfccaf8f
17	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiJkMzlmYWU3MzgxOTk0YWQxYWM2MDQyN2Y4ZjY4ZGEwNCIsInVzZXJfaWQiOjN9.iN6XUoWMtHE61HEqVFqaae9Srm899QQ1duYafxNFBAg	\N	2021-12-30 16:45:47+03	\N	d39fae7381994ad1ac60427f8f68da04
18	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiJmYmM5OTA2ZGVlMGE0OWUxYTI5ZjFkNDRhN2M0YjE4ZCIsInVzZXJfaWQiOjN9.jcEPy7BNTLKJKtCNEFkJREdWrWp52L1Cm3AW2JiG9uE	\N	2021-12-30 16:45:47+03	\N	fbc9906dee0a49e1a29f1d44a7c4b18d
19	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiIxMzQ1NDJmNjk2MWQ0YWIyYWIyNzgxNGEzNTdmYTdhYyIsInVzZXJfaWQiOjN9.85thJHwvs2zhWcFISK3r8THeD2xVfyUhsksxI78JJdM	\N	2021-12-30 16:45:47+03	\N	134542f6961d4ab2ab27814a357fa7ac
20	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiI1N2U0ZDU2NjEyMjc0NjcxYmQxNTg4YTc4NjgwNDYwNiIsInVzZXJfaWQiOjN9._alEEZ1dPheHXAZtcJvs0Cqx58wrNMFW_ZironxxwOE	\N	2021-12-30 16:45:47+03	\N	57e4d56612274671bd1588a786804606
21	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiJlNzdiZTY1ZWQ1OGM0ZWYwYjM5NzZjNWYxMTVmYThlMSIsInVzZXJfaWQiOjN9.p5V9cKeE1FZ5c6ZG2wsL0xFcSNN30HBzfaGuD8PwBOo	\N	2021-12-30 16:45:47+03	\N	e77be65ed58c4ef0b3976c5f115fa8e1
22	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiI0ZjMwZTcxYmFmYTE0YmY4OTU2ZTE5ZDBhNTNkMDRmMyIsInVzZXJfaWQiOjN9.9DhPZp2zNrt8IVFC51-VjU4ceL5kPt5oaFQPssKBfCk	\N	2021-12-30 16:45:47+03	\N	4f30e71bafa14bf8956e19d0a53d04f3
23	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiI0ZDU1NTBkMDg2YjM0ZTBhOGQwODIyZDZjN2Y4MzgzMSIsInVzZXJfaWQiOjN9.sjD-QxLQFft3tuaWfczMFR-TZen27Ss2LV3-Ux-4z70	\N	2021-12-30 16:45:47+03	\N	4d5550d086b34e0a8d0822d6c7f83831
24	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiJjNmIxZTA4OTg0Mjc0M2ZiYTBiZjNhNDkzMDAyMGQ0YiIsInVzZXJfaWQiOjN9.xaywPHs2uy7at_NbcH-hKtMtFZwr6Q72IQXpLOIzHkI	\N	2021-12-30 16:45:47+03	\N	c6b1e089842743fba0bf3a4930020d4b
25	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiI5Yjk1NDA0ZDkzZGI0OTlkOTkxN2Y5YTk5Njc4NzNmYSIsInVzZXJfaWQiOjN9.LvxLRNJb11obN6ds-ROdx5D7BFgGfYoCJy1q19q3KoM	\N	2021-12-30 16:45:47+03	\N	9b95404d93db499d9917f9a9967873fa
26	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiI4ZWVlZDMyYTk4ZDQ0Mzc0OTZlMDk5OTAzMDFlYWNlMSIsInVzZXJfaWQiOjN9.6umqPDIkcItt5INnNZ-_fPgrgTRtdSkRtj78Z2biGfA	\N	2021-12-30 16:45:47+03	\N	8eeed32a98d4437496e09990301eace1
27	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiJlNWQ5YzljNDI0NzU0YzViODJjNDk3ZTFmM2RkNzQ3ZiIsInVzZXJfaWQiOjN9.gQptWsvlN4X8WTacFNEsPQTFBd7DwxYTDrf5Kgt--Y0	\N	2021-12-30 16:45:47+03	\N	e5d9c9c424754c5b82c497e1f3dd747f
28	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0NywiaWF0IjoxNjQwNzg1NTQ3LCJqdGkiOiJkYjIyODA5MjU5NTQ0ZWI5YjQ2ODc2YzdlOTRlOGY1ZCIsInVzZXJfaWQiOjN9.4kevAfTW-_vAovge6la6euaoz0HgZmKmx5WslAyhnyw	\N	2021-12-30 16:45:47+03	\N	db22809259544eb9b46876c7e94e8f5d
29	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiJmZDE4YmQ0OWJmOTU0MTdlOTM2MGViOWNhNTlmNjY1NSIsInVzZXJfaWQiOjN9.TRAaUfm82ySdwItlzOHe3szxLQuzRAzps0Kvf_3vX1Y	\N	2021-12-30 16:45:48+03	\N	fd18bd49bf95417e9360eb9ca59f6655
30	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiJjOWYxNDlmZGUxZWE0MjkxYTAyNTc5NGNiODMzNTBjNCIsInVzZXJfaWQiOjN9.JcZzQxTtpJ1hKM07AT24igOqiRCfT6O8M--dR0ybIJE	\N	2021-12-30 16:45:48+03	\N	c9f149fde1ea4291a025794cb83350c4
31	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiI1YWQwMDUyZGRhNTQ0MjM2YmNkMmQ4OWEwNzVmMzg0YyIsInVzZXJfaWQiOjN9.K7s45T-9qMzhsZjQxLjpL5ikrlStKtiJaWv78HEL6BY	\N	2021-12-30 16:45:48+03	\N	5ad0052dda544236bcd2d89a075f384c
32	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiI4ZjFiM2VmMTNiN2Q0YjlkYWQxZjIxN2M1MjA1MGI5NSIsInVzZXJfaWQiOjN9.J7cZP6UPKz2p8gG0dIE0f8dMSZrlEkLY89WauGFywDU	\N	2021-12-30 16:45:48+03	\N	8f1b3ef13b7d4b9dad1f217c52050b95
33	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiJkMzkxMjM1OTIwYzY0ZjY4YjMyZWViZjAxMGE0M2E0OCIsInVzZXJfaWQiOjN9.pvJVtOn5IPatF2RJQKOHudpFhD2kS2cNOIGo20PQNzM	\N	2021-12-30 16:45:48+03	\N	d391235920c64f68b32eebf010a43a48
34	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiJkNGMxNDA2ZjI0MGM0OTJhOWZmNjllMmFjYjJlMjgyZiIsInVzZXJfaWQiOjN9.0-aChuOesKm1dy5Fb9Lb8vEPxeQFsnX_NfodRXI4H2I	\N	2021-12-30 16:45:48+03	\N	d4c1406f240c492a9ff69e2acb2e282f
35	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiIwZGNkMGYwNDYwMzg0MTliODQxNDkyMjAyM2E1ZWI2ZCIsInVzZXJfaWQiOjN9.ZTKsfQViTSfexKugl3oCFj0PG3drDFGxlq_FUxQHExs	\N	2021-12-30 16:45:48+03	\N	0dcd0f046038419b8414922023a5eb6d
36	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiIzODJkYzllMjJmZjQ0MjU4ODQxNDhiZjFkZjQ3MzkyNiIsInVzZXJfaWQiOjN9.-n8kyW61utcSpcPlsb2kJGN1DcS-LEyPzq7cu5pfbMM	\N	2021-12-30 16:45:48+03	\N	382dc9e22ff4425884148bf1df473926
37	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiIxYmI0YmFmOTkxZDE0NDY2YWQ1N2U3YjhiYTc1NjIyMSIsInVzZXJfaWQiOjN9.LwUOgDNhbOX5GMWuVO6635pz1t1HWB9jmf2zOk66RoY	\N	2021-12-30 16:45:48+03	\N	1bb4baf991d14466ad57e7b8ba756221
38	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiIwMTIxNDQ5MThhY2U0ZTVjYWI0ODNhYWQwZTc0ZWU0OCIsInVzZXJfaWQiOjN9.2Y7PzrvPRBMXDrkr5ay8g_5uh2B1qbWqMTveu903m4w	\N	2021-12-30 16:45:48+03	\N	012144918ace4e5cab483aad0e74ee48
39	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OCwiaWF0IjoxNjQwNzg1NTQ4LCJqdGkiOiI4ZGZhNDAxODNmMmM0NDg1Yjk4ZjRlZGQyMzc5OGVjNSIsInVzZXJfaWQiOjN9.wrNfk55JBNKNRwHwUtPeQxj92OIywDwDj2BGVmK5zqs	\N	2021-12-30 16:45:48+03	\N	8dfa40183f2c4485b98f4edd23798ec5
40	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiI5YzQwNzllOTA3MTM0ZDBhYmQ1MzE1YWQxNmNlN2VhNSIsInVzZXJfaWQiOjN9.6TAkzM5c2ie5PYRFfcKhG4zLwjss-IbVmu_8PjghY-M	\N	2021-12-30 16:45:49+03	\N	9c4079e907134d0abd5315ad16ce7ea5
41	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiIxNGRlYmQwZjFkMDQ0MDQ1ODJkZjg4OTNiOWY2ZTQ5YSIsInVzZXJfaWQiOjN9.PdKdDR3p4xE-B5D04rq0RZvL-KXC5blmDWQS-cDdNs8	\N	2021-12-30 16:45:49+03	\N	14debd0f1d04404582df8893b9f6e49a
42	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiJiN2NjNjY5ZThhMjA0NDlkOWFkMTYxYmUwZjkyOWEyNyIsInVzZXJfaWQiOjN9.s_Df6DAs-AK73OrWGOg3-EsVTWX06RDSkUkvVpLt3uY	\N	2021-12-30 16:45:49+03	\N	b7cc669e8a20449d9ad161be0f929a27
43	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiI2M2M0MTI5NTZiNjI0NzExOGEzM2ZlYzkxMmI2ZDYxYSIsInVzZXJfaWQiOjN9.lMLNMjaXypdnNyAu8-BLQ78oTWLr8UkEeLEC_Lsxr1w	\N	2021-12-30 16:45:49+03	\N	63c412956b6247118a33fec912b6d61a
44	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiIzNmZjYmE4ODE5YmU0YjY5YmNmMDQ5YjkwMjVmMjFmMSIsInVzZXJfaWQiOjN9.z614Cn3ezSebWtfOGz00mftihYgPenYnHkauFkmR7rU	\N	2021-12-30 16:45:49+03	\N	36fcba8819be4b69bcf049b9025f21f1
45	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiI4Njc5ZDgwNGZkOTg0OGVkOGU4ZWVlNjdmODBiNGE2YiIsInVzZXJfaWQiOjN9.sIaRXCDZ0QNUOPYuSMZ7on9M4x6jxVBggW27yYZEHmc	\N	2021-12-30 16:45:49+03	\N	8679d804fd9848ed8e8eee67f80b4a6b
46	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiI2YjI0YWVhZmUzZTE0OTVjOWM1Nzg4YjEwNDIzYjRlOSIsInVzZXJfaWQiOjN9.aTecFZmV4fmUu0HvgY46bh5a-h21Ef4YIjSKhkp99NY	\N	2021-12-30 16:45:49+03	\N	6b24aeafe3e1495c9c5788b10423b4e9
47	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiJhZDE3YzVmM2QwOTc0OGNjODFkZDg1MzcyZWYyNjQ3ZSIsInVzZXJfaWQiOjN9.I2BKTXRYZlZfUwm17ZqaRDu5YL2oxcZggbbgJNjrRDg	\N	2021-12-30 16:45:49+03	\N	ad17c5f3d09748cc81dd85372ef2647e
48	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiIwZjgyNTBlZWQ5Njk0ZWRmYjg0YjkwNjRlNzljNGNhMCIsInVzZXJfaWQiOjN9.mi7CHkTEAdrNFTY337asZhZmSptjQ-W6LrIJ9aXdVXc	\N	2021-12-30 16:45:49+03	\N	0f8250eed9694edfb84b9064e79c4ca0
49	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MTk0OSwiaWF0IjoxNjQwNzg1NTQ5LCJqdGkiOiI2MDQzYWYwMTUzNTk0M2ViOTBkYjM4NTUzM2I2OTEwMyIsInVzZXJfaWQiOjN9.hgoxvLUZlkFaritfjBid4uOTa0CjnXH35bT1ek1lgJw	\N	2021-12-30 16:45:49+03	\N	6043af01535943eb90db385533b69103
50	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MDg3MzY5MywiaWF0IjoxNjQwNzg3MjkzLCJqdGkiOiI0YmFmZDY3YTc2NDc0NzgwOWRkMzRlMDQyNDZkYmNhYyIsInVzZXJfaWQiOjR9.vt-jT_2paoZI5wTRAmMhwudxd-zvHazqcKVxfXaQngM	2021-12-29 17:14:53.501166+03	2021-12-30 17:14:53+03	4	4bafd67a764747809dd34e04246dbcac
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 4, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: shop_api_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.shop_api_customuser_groups_id_seq', 1, false);


--
-- Name: shop_api_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.shop_api_customuser_id_seq', 4, true);


--
-- Name: shop_api_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.shop_api_customuser_user_permissions_id_seq', 1, false);


--
-- Name: shop_api_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.shop_api_product_id_seq', 10, true);


--
-- Name: shop_api_productcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.shop_api_productcategory_id_seq', 3, true);


--
-- Name: shop_api_shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.shop_api_shop_id_seq', 2, true);


--
-- Name: shop_api_shop_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.shop_api_shop_products_id_seq', 31, true);


--
-- Name: shop_api_shopinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.shop_api_shopinfo_id_seq', 2, true);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 50, true);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: local_ecommerce
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 50, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shop_api_customuser shop_api_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser
    ADD CONSTRAINT shop_api_customuser_email_key UNIQUE (email);


--
-- Name: shop_api_customuser_groups shop_api_customuser_groups_customuser_id_group_id_932a5e8c_uniq; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_groups
    ADD CONSTRAINT shop_api_customuser_groups_customuser_id_group_id_932a5e8c_uniq UNIQUE (customuser_id, group_id);


--
-- Name: shop_api_customuser_groups shop_api_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_groups
    ADD CONSTRAINT shop_api_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: shop_api_customuser shop_api_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser
    ADD CONSTRAINT shop_api_customuser_pkey PRIMARY KEY (id);


--
-- Name: shop_api_customuser_user_permissions shop_api_customuser_user_customuser_id_permission_70af0539_uniq; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_user_permissions
    ADD CONSTRAINT shop_api_customuser_user_customuser_id_permission_70af0539_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: shop_api_customuser shop_api_customuser_user_name_key; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser
    ADD CONSTRAINT shop_api_customuser_user_name_key UNIQUE (user_name);


--
-- Name: shop_api_customuser_user_permissions shop_api_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_user_permissions
    ADD CONSTRAINT shop_api_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: shop_api_product shop_api_product_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_product
    ADD CONSTRAINT shop_api_product_pkey PRIMARY KEY (id);


--
-- Name: shop_api_productcategory shop_api_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_productcategory
    ADD CONSTRAINT shop_api_productcategory_pkey PRIMARY KEY (id);


--
-- Name: shop_api_shop shop_api_shop_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shop
    ADD CONSTRAINT shop_api_shop_pkey PRIMARY KEY (id);


--
-- Name: shop_api_shop_products shop_api_shop_products_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shop_products
    ADD CONSTRAINT shop_api_shop_products_pkey PRIMARY KEY (id);


--
-- Name: shop_api_shop_products shop_api_shop_products_shop_id_product_id_65c84f78_uniq; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shop_products
    ADD CONSTRAINT shop_api_shop_products_shop_id_product_id_65c84f78_uniq UNIQUE (shop_id, product_id);


--
-- Name: shop_api_shopinfo shop_api_shopinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shopinfo
    ADD CONSTRAINT shop_api_shopinfo_pkey PRIMARY KEY (id);


--
-- Name: shop_api_shopinfo shop_api_shopinfo_shop_name_1afcbba0_uniq; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shopinfo
    ADD CONSTRAINT shop_api_shopinfo_shop_name_1afcbba0_uniq UNIQUE (shop_name);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_key; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shop_api_customuser_email_d10aea4a_like; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_customuser_email_d10aea4a_like ON public.shop_api_customuser USING btree (email varchar_pattern_ops);


--
-- Name: shop_api_customuser_groups_customuser_id_4765a218; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_customuser_groups_customuser_id_4765a218 ON public.shop_api_customuser_groups USING btree (customuser_id);


--
-- Name: shop_api_customuser_groups_group_id_95f15312; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_customuser_groups_group_id_95f15312 ON public.shop_api_customuser_groups USING btree (group_id);


--
-- Name: shop_api_customuser_user_name_67360f12_like; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_customuser_user_name_67360f12_like ON public.shop_api_customuser USING btree (user_name varchar_pattern_ops);


--
-- Name: shop_api_customuser_user_permissions_customuser_id_450bae42; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_customuser_user_permissions_customuser_id_450bae42 ON public.shop_api_customuser_user_permissions USING btree (customuser_id);


--
-- Name: shop_api_customuser_user_permissions_permission_id_106fd3c3; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_customuser_user_permissions_permission_id_106fd3c3 ON public.shop_api_customuser_user_permissions USING btree (permission_id);


--
-- Name: shop_api_product_category_id_591025be; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_product_category_id_591025be ON public.shop_api_product USING btree (category_id);


--
-- Name: shop_api_product_creator_id_53574522; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_product_creator_id_53574522 ON public.shop_api_product USING btree (creator_id);


--
-- Name: shop_api_product_shop_inf_id_e2efa9d3; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_product_shop_inf_id_e2efa9d3 ON public.shop_api_product USING btree (shop_inf_id);


--
-- Name: shop_api_shop_products_product_id_be5e6587; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_shop_products_product_id_be5e6587 ON public.shop_api_shop_products USING btree (product_id);


--
-- Name: shop_api_shop_products_shop_id_f53fef98; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_shop_products_shop_id_f53fef98 ON public.shop_api_shop_products USING btree (shop_id);


--
-- Name: shop_api_shop_shop_info_id_08e23d7a; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_shop_shop_info_id_08e23d7a ON public.shop_api_shop USING btree (shop_info_id);


--
-- Name: shop_api_shopinfo_owner_id_df1351a6; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_shopinfo_owner_id_df1351a6 ON public.shop_api_shopinfo USING btree (owner_id);


--
-- Name: shop_api_shopinfo_shop_name_1afcbba0_like; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX shop_api_shopinfo_shop_name_1afcbba0_like ON public.shop_api_shopinfo USING btree (shop_name varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_user_id_83bc629a; Type: INDEX; Schema: public; Owner: local_ecommerce
--

CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_shop_api_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_shop_api_customuser_id FOREIGN KEY (user_id) REFERENCES public.shop_api_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_customuser_user_permissions shop_api_customuser__customuser_id_450bae42_fk_shop_api_; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_user_permissions
    ADD CONSTRAINT shop_api_customuser__customuser_id_450bae42_fk_shop_api_ FOREIGN KEY (customuser_id) REFERENCES public.shop_api_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_customuser_groups shop_api_customuser__customuser_id_4765a218_fk_shop_api_; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_groups
    ADD CONSTRAINT shop_api_customuser__customuser_id_4765a218_fk_shop_api_ FOREIGN KEY (customuser_id) REFERENCES public.shop_api_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_customuser_user_permissions shop_api_customuser__permission_id_106fd3c3_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_user_permissions
    ADD CONSTRAINT shop_api_customuser__permission_id_106fd3c3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_customuser_groups shop_api_customuser_groups_group_id_95f15312_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_customuser_groups
    ADD CONSTRAINT shop_api_customuser_groups_group_id_95f15312_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_product shop_api_product_category_id_591025be_fk_shop_api_; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_product
    ADD CONSTRAINT shop_api_product_category_id_591025be_fk_shop_api_ FOREIGN KEY (category_id) REFERENCES public.shop_api_productcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_product shop_api_product_creator_id_53574522_fk_shop_api_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_product
    ADD CONSTRAINT shop_api_product_creator_id_53574522_fk_shop_api_customuser_id FOREIGN KEY (creator_id) REFERENCES public.shop_api_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_product shop_api_product_shop_inf_id_e2efa9d3_fk_shop_api_shopinfo_id; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_product
    ADD CONSTRAINT shop_api_product_shop_inf_id_e2efa9d3_fk_shop_api_shopinfo_id FOREIGN KEY (shop_inf_id) REFERENCES public.shop_api_shopinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_shop_products shop_api_shop_produc_product_id_be5e6587_fk_shop_api_; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shop_products
    ADD CONSTRAINT shop_api_shop_produc_product_id_be5e6587_fk_shop_api_ FOREIGN KEY (product_id) REFERENCES public.shop_api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_shop_products shop_api_shop_products_shop_id_f53fef98_fk_shop_api_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shop_products
    ADD CONSTRAINT shop_api_shop_products_shop_id_f53fef98_fk_shop_api_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop_api_shop(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_shop shop_api_shop_shop_info_id_08e23d7a_fk_shop_api_shopinfo_id; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shop
    ADD CONSTRAINT shop_api_shop_shop_info_id_08e23d7a_fk_shop_api_shopinfo_id FOREIGN KEY (shop_info_id) REFERENCES public.shop_api_shopinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_api_shopinfo shop_api_shopinfo_owner_id_df1351a6_fk_shop_api_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.shop_api_shopinfo
    ADD CONSTRAINT shop_api_shopinfo_owner_id_df1351a6_fk_shop_api_customuser_id FOREIGN KEY (owner_id) REFERENCES public.shop_api_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk FOREIGN KEY (token_id) REFERENCES public.token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outs_user_id_83bc629a_fk_shop_api_; Type: FK CONSTRAINT; Schema: public; Owner: local_ecommerce
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_shop_api_ FOREIGN KEY (user_id) REFERENCES public.shop_api_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

