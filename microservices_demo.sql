--
-- PostgreSQL database dump
--

\restrict QQOOX0XWZ57uB0jCeeKpuocXfdm3TNTQWKJYJoP2IJlu9cCQXZ7mBiMlz4jYKep

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

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
-- Name: metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metrics (
    id integer NOT NULL,
    metric_name character varying(255),
    metric_value character varying(255),
    pod_name character varying(255),
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.metrics OWNER TO postgres;

--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metrics_id_seq OWNER TO postgres;

--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metrics_id_seq OWNED BY public.metrics.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_id character varying(255),
    customer_email character varying(255),
    total_amount numeric(10,2),
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: metrics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics ALTER COLUMN id SET DEFAULT nextval('public.metrics_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metrics (id, metric_name, metric_value, pod_name, "timestamp") FROM stdin;
1	pods_running	15	cluster	2025-11-17 05:50:12.398166
2	pods_total	17	cluster	2025-11-17 05:50:12.445515
3	nodes_ready	1	cluster	2025-11-17 05:50:12.703808
4	nodes_total	1	cluster	2025-11-17 05:50:12.733944
5	services_total	17	cluster	2025-11-17 05:50:13.008727
6	pod_availability_percent	88.24	cluster	2025-11-17 05:50:13.039169
7	node_availability_percent	100.0	cluster	2025-11-17 05:50:13.08905
8	checkout_calls	1	process	2025-11-17 05:50:16.636606
9	payment_calls	1	process	2025-11-17 05:50:16.667374
10	pods_running	15	cluster	2025-11-17 05:50:33.330058
11	pods_total	17	cluster	2025-11-17 05:50:33.364129
12	nodes_ready	1	cluster	2025-11-17 05:50:33.595473
13	nodes_total	1	cluster	2025-11-17 05:50:33.62653
14	services_total	17	cluster	2025-11-17 05:50:33.833418
15	pod_availability_percent	88.24	cluster	2025-11-17 05:50:33.861928
16	node_availability_percent	100.0	cluster	2025-11-17 05:50:33.902481
17	frontend_calls	1	browse	2025-11-17 05:50:35.610159
18	frontend_calls	1	browse	2025-11-17 05:50:35.644572
19	cartservice_calls	1	add	2025-11-17 05:50:36.61106
20	cartservice_calls	1	add	2025-11-17 05:50:36.651003
21	productcatalog_calls	1	view	2025-11-17 05:50:37.745212
22	productcatalog_calls	1	view	2025-11-17 05:50:38.618766
23	productcatalog_calls	1	view	2025-11-17 05:50:38.647014
24	productcatalog_calls	1	view	2025-11-17 05:50:39.638523
25	productcatalog_calls	1	view	2025-11-17 05:50:39.672206
26	checkout_calls	1	process	2025-11-17 05:50:40.611787
27	payment_calls	1	process	2025-11-17 05:50:40.639295
28	checkout_calls	1	process	2025-11-17 05:50:41.357521
29	payment_calls	1	process	2025-11-17 05:50:41.388473
30	pods_running	15	cluster	2025-11-17 05:50:54.167151
31	pods_total	17	cluster	2025-11-17 05:50:54.205349
32	nodes_ready	1	cluster	2025-11-17 05:50:54.418343
33	nodes_total	1	cluster	2025-11-17 05:50:54.458489
34	services_total	17	cluster	2025-11-17 05:50:54.672869
35	pod_availability_percent	88.24	cluster	2025-11-17 05:50:54.717196
36	node_availability_percent	100.0	cluster	2025-11-17 05:50:54.746933
37	productcatalog_calls	1	view	2025-11-17 05:50:57.800008
38	cartservice_calls	1	add	2025-11-17 05:50:58.465738
39	checkout_calls	1	process	2025-11-17 05:50:59.116222
40	payment_calls	1	process	2025-11-17 05:50:59.148608
41	productcatalog_calls	1	view	2025-11-17 05:50:59.193975
42	checkout_calls	1	process	2025-11-17 05:51:00.141666
43	payment_calls	1	process	2025-11-17 05:51:00.1688
44	productcatalog_calls	1	view	2025-11-17 05:51:00.451774
45	productcatalog_calls	1	view	2025-11-17 05:51:00.747734
46	frontend_calls	1	browse	2025-11-17 05:51:01.274219
47	productcatalog_calls	1	view	2025-11-17 05:51:02.765292
48	checkout_calls	1	process	2025-11-17 05:51:03.203685
49	payment_calls	1	process	2025-11-17 05:51:03.233903
50	productcatalog_calls	1	view	2025-11-17 05:51:03.292485
51	checkout_calls	1	process	2025-11-17 05:51:03.388603
52	payment_calls	1	process	2025-11-17 05:51:03.418367
53	checkout_calls	1	process	2025-11-17 05:51:04.483978
54	payment_calls	1	process	2025-11-17 05:51:04.520043
55	pods_running	15	cluster	2025-11-17 05:51:14.99252
56	pods_total	17	cluster	2025-11-17 05:51:15.034962
57	nodes_ready	1	cluster	2025-11-17 05:51:15.247412
58	nodes_total	1	cluster	2025-11-17 05:51:15.278691
59	services_total	17	cluster	2025-11-17 05:51:15.499736
60	pod_availability_percent	88.24	cluster	2025-11-17 05:51:15.53728
61	node_availability_percent	100.0	cluster	2025-11-17 05:51:15.567303
62	frontend_calls	1	browse	2025-11-17 05:51:21.389218
63	cartservice_calls	1	add	2025-11-17 05:51:23.504255
64	frontend_calls	1	browse	2025-11-17 05:51:24.628904
65	checkout_calls	1	process	2025-11-17 05:51:24.723152
66	payment_calls	1	process	2025-11-17 05:51:24.753361
67	productcatalog_calls	1	view	2025-11-17 05:51:25.279675
68	frontend_calls	1	browse	2025-11-17 05:51:25.447808
69	checkout_calls	1	process	2025-11-17 05:51:25.848522
70	payment_calls	1	process	2025-11-17 05:51:25.881249
71	pods_running	15	cluster	2025-11-17 05:51:35.779803
72	pods_total	17	cluster	2025-11-17 05:51:35.812649
73	nodes_ready	1	cluster	2025-11-17 05:51:36.009504
74	nodes_total	1	cluster	2025-11-17 05:51:36.045098
75	services_total	17	cluster	2025-11-17 05:51:36.271385
76	pod_availability_percent	88.24	cluster	2025-11-17 05:51:36.316688
77	node_availability_percent	100.0	cluster	2025-11-17 05:51:36.349818
78	productcatalog_calls	1	view	2025-11-17 05:51:43.195219
79	cartservice_calls	1	add	2025-11-17 05:51:43.412032
80	productcatalog_calls	1	view	2025-11-17 05:51:43.925568
81	checkout_calls	1	process	2025-11-17 05:51:44.576573
82	payment_calls	1	process	2025-11-17 05:51:44.623498
83	productcatalog_calls	1	view	2025-11-17 05:51:47.67465
84	checkout_calls	1	process	2025-11-17 05:51:47.800574
85	payment_calls	1	process	2025-11-17 05:51:47.83472
86	frontend_calls	1	browse	2025-11-17 05:51:48.231209
87	cartservice_calls	1	add	2025-11-17 05:51:48.341463
88	productcatalog_calls	1	view	2025-11-17 05:51:48.648087
89	productcatalog_calls	1	view	2025-11-17 05:51:49.627918
90	pods_running	15	cluster	2025-11-17 05:51:56.601057
91	pods_total	17	cluster	2025-11-17 05:51:56.637254
92	nodes_ready	1	cluster	2025-11-17 05:51:56.882914
93	nodes_total	1	cluster	2025-11-17 05:51:56.91597
94	services_total	17	cluster	2025-11-17 05:51:57.124785
95	pod_availability_percent	88.24	cluster	2025-11-17 05:51:57.161305
96	node_availability_percent	100.0	cluster	2025-11-17 05:51:57.19354
97	frontend_calls	1	browse	2025-11-17 05:52:06.736767
98	productcatalog_calls	1	view	2025-11-17 05:52:06.870748
99	checkout_calls	1	process	2025-11-17 05:52:09.235564
100	payment_calls	1	process	2025-11-17 05:52:09.266976
101	checkout_calls	1	process	2025-11-17 05:52:09.352883
102	payment_calls	1	process	2025-11-17 05:52:09.389527
103	productcatalog_calls	1	view	2025-11-17 05:52:09.606038
104	productcatalog_calls	1	view	2025-11-17 05:52:10.758237
105	cartservice_calls	1	add	2025-11-17 05:52:11.358343
106	checkout_calls	1	process	2025-11-17 05:52:11.544335
107	payment_calls	1	process	2025-11-17 05:52:11.580088
108	frontend_calls	1	browse	2025-11-17 05:52:12.022761
109	frontend_calls	1	browse	2025-11-17 05:52:12.315593
110	frontend_calls	1	browse	2025-11-17 05:52:12.658019
111	pods_running	15	cluster	2025-11-17 05:52:17.454689
112	pods_total	17	cluster	2025-11-17 05:52:17.49697
113	nodes_ready	1	cluster	2025-11-17 05:52:17.699418
114	nodes_total	1	cluster	2025-11-17 05:52:17.729338
115	services_total	17	cluster	2025-11-17 05:52:17.937453
116	pod_availability_percent	88.24	cluster	2025-11-17 05:52:17.971601
117	node_availability_percent	100.0	cluster	2025-11-17 05:52:18.042229
118	productcatalog_calls	1	view	2025-11-17 05:52:29.015165
119	cartservice_calls	1	add	2025-11-17 05:52:31.379172
120	checkout_calls	1	process	2025-11-17 05:52:31.902681
121	payment_calls	1	process	2025-11-17 05:52:31.937066
122	cartservice_calls	1	add	2025-11-17 05:52:32.98704
123	productcatalog_calls	1	view	2025-11-17 05:52:34.424227
124	productcatalog_calls	1	view	2025-11-17 05:52:35.221082
125	cartservice_calls	1	add	2025-11-17 05:52:35.550699
126	productcatalog_calls	1	view	2025-11-17 05:52:35.777959
127	pods_running	15	cluster	2025-11-17 05:52:38.281874
128	pods_total	17	cluster	2025-11-17 05:52:38.337009
129	nodes_ready	1	cluster	2025-11-17 05:52:38.537108
130	nodes_total	1	cluster	2025-11-17 05:52:38.567767
131	services_total	17	cluster	2025-11-17 05:52:38.762861
132	pod_availability_percent	88.24	cluster	2025-11-17 05:52:38.801893
133	node_availability_percent	100.0	cluster	2025-11-17 05:52:38.827975
134	frontend_calls	1	browse	2025-11-17 05:52:51.755967
135	productcatalog_calls	1	view	2025-11-17 05:52:54.052714
136	checkout_calls	1	process	2025-11-17 05:52:54.488745
137	payment_calls	1	process	2025-11-17 05:52:54.529382
138	checkout_calls	1	process	2025-11-17 05:52:55.007307
139	payment_calls	1	process	2025-11-17 05:52:55.036965
140	frontend_calls	1	browse	2025-11-17 05:52:55.069774
141	productcatalog_calls	1	view	2025-11-17 05:52:55.102746
142	cartservice_calls	1	add	2025-11-17 05:52:56.801067
143	productcatalog_calls	1	view	2025-11-17 05:52:58.129299
144	frontend_calls	1	browse	2025-11-17 05:52:58.175856
145	frontend_calls	1	browse	2025-11-17 05:52:58.6886
146	pods_running	15	cluster	2025-11-17 05:52:59.096078
147	pods_total	17	cluster	2025-11-17 05:52:59.136333
148	nodes_ready	1	cluster	2025-11-17 05:52:59.337444
149	nodes_total	1	cluster	2025-11-17 05:52:59.392757
150	services_total	17	cluster	2025-11-17 05:52:59.63381
151	pod_availability_percent	88.24	cluster	2025-11-17 05:52:59.674419
152	node_availability_percent	100.0	cluster	2025-11-17 05:52:59.71068
153	productcatalog_calls	1	view	2025-11-17 05:52:59.865411
154	checkout_calls	1	process	2025-11-17 05:53:01.435941
155	payment_calls	1	process	2025-11-17 05:53:01.468296
156	checkout_calls	1	process	2025-11-17 05:53:15.498064
157	payment_calls	1	process	2025-11-17 05:53:15.534906
158	checkout_calls	1	process	2025-11-17 05:53:15.591069
159	payment_calls	1	process	2025-11-17 05:53:15.626611
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, order_id, customer_email, total_amount, status, created_at) FROM stdin;
1	ORD-24AAD1A4	user_b87098@example.com	291.53	completed	2025-11-17 05:50:16.594395
2	ORD-8AD7E09F	user_edc3a0@example.com	267.98	completed	2025-11-17 05:50:40.575761
3	ORD-3873B697	user_e60dc9@example.com	89.14	completed	2025-11-17 05:50:41.323413
4	ORD-4AAD709F	user_519ecc@example.com	168.43	completed	2025-11-17 05:50:59.071415
5	ORD-00425C65	user_fbe69c@example.com	70.55	completed	2025-11-17 05:51:00.094496
6	ORD-C32CEA4C	user_af3123@example.com	106.19	completed	2025-11-17 05:51:03.169283
7	ORD-6174635B	user_f25633@example.com	244.00	completed	2025-11-17 05:51:03.357672
8	ORD-662EBBA9	user_9c39c8@example.com	209.66	completed	2025-11-17 05:51:04.42752
9	ORD-C201E102	user_67de34@example.com	106.60	completed	2025-11-17 05:51:24.684156
10	ORD-2C991BE5	user_3e778a@example.com	114.23	completed	2025-11-17 05:51:25.817796
11	ORD-2FBAD379	user_325ae9@example.com	274.27	completed	2025-11-17 05:51:44.542303
12	ORD-49EADD24	user_924ec4@example.com	254.87	completed	2025-11-17 05:51:47.767974
13	ORD-F4C0E09C	user_076749@example.com	203.85	completed	2025-11-17 05:52:09.207417
14	ORD-ED07D10C	user_491b98@example.com	96.92	completed	2025-11-17 05:52:09.318412
15	ORD-FCB6FE4C	user_c8a863@example.com	227.32	completed	2025-11-17 05:52:11.513735
16	ORD-7C2D3CFD	user_1fc5a1@example.com	100.92	completed	2025-11-17 05:52:31.871515
17	ORD-A2901FE1	user_d148a6@example.com	204.43	completed	2025-11-17 05:52:54.451796
18	ORD-FE9E3E93	user_cece6e@example.com	176.18	completed	2025-11-17 05:52:54.973225
19	ORD-816F41D7	user_b2f0b0@example.com	258.92	completed	2025-11-17 05:53:01.398241
20	ORD-990CDDCC	user_38a38b@example.com	219.81	completed	2025-11-17 05:53:15.470339
21	ORD-F16A5B3F	user_b9d896@example.com	180.55	completed	2025-11-17 05:53:15.563
\.


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metrics_id_seq', 159, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 21, true);


--
-- Name: metrics metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict QQOOX0XWZ57uB0jCeeKpuocXfdm3TNTQWKJYJoP2IJlu9cCQXZ7mBiMlz4jYKep

