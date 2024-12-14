--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: games; Type: TABLE; Schema: public; Owner: nfagames
--

CREATE TABLE public.games (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    main_image_url character varying NOT NULL,
    footage_images character varying[] NOT NULL,
    genres character varying[] NOT NULL,
    os character varying[] NOT NULL,
    publisher character varying(100) NOT NULL,
    developer character varying(100) NOT NULL,
    release_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.games OWNER TO nfagames;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: nfagames
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_id_seq OWNER TO nfagames;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nfagames
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: nfagames
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: nfagames
--

COPY public.games (id, title, description, main_image_url, footage_images, genres, os, publisher, developer, release_date, created_at) FROM stdin;
1	Skyward Legends	Take to the skies in this epic fantasy flight simulator, commanding legendary creatures and engaging in aerial battles.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{"Flight Simulator",Fantasy,Action}	{Windows,macOS}	AeroMagic	SkyForge Studios	2025-02-10 00:00:00	2024-12-14 00:08:16.444194
2	Dungeon Delvers	Embark on a thrilling journey through mysterious dungeons filled with traps, treasures, and formidable foes.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{RPG,Adventure,Action}	{Windows,Linux}	EpicQuest	DarkCave Games	2024-11-15 00:00:00	2024-12-14 00:08:28.347734
3	Cyber Nexus	Dive into a futuristic cyberpunk world where technology and humanity collide in high-stakes missions.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{Action,Shooter,Sci-Fi}	{Windows,PlayStation,Xbox}	NeonWave	TechPulse Interactive	2025-05-22 00:00:00	2024-12-14 00:08:35.322921
4	Mystic Gardens	Cultivate your own magical garden, discovering enchanted plants and mystical creatures along the way.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{Simulation,Casual,Fantasy}	{Windows,macOS,iOS,Android}	GreenThumb	BloomSoft	2024-08-30 00:00:00	2024-12-14 00:08:42.748945
5	Galactic Frontier	Explore the vast expanse of space, colonize new planets, and engage in interstellar diplomacy and warfare.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{Strategy,Simulation,Sci-Fi}	{Windows,macOS,Linux}	StarVentures	CosmoWorks	2025-01-20 00:00:00	2024-12-14 00:08:49.135827
6	Shadow Realm	Navigate through a dark and mysterious world filled with secrets, puzzles, and shadowy adversaries.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{Puzzle,Adventure,Horror}	{Windows,macOS}	NightShade	DarkLight Studios	2024-12-05 00:00:00	2024-12-14 00:08:55.230602
7	Racing Rivals	Compete in high-octane races across diverse tracks, customizing your vehicles for maximum performance.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{Racing,Sports,Action}	{Windows,PlayStation,Xbox,"Nintendo Switch"}	SpeedMasters	TurboGames	2025-03-18 00:00:00	2024-12-14 00:09:02.530007
8	Ancient Empires	Build and manage your own ancient civilization, balancing resources, technology, and military power.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{Strategy,Simulation,Historical}	{Windows,macOS,Linux}	EmpireForge	HistoryHub	2025-04-25 00:00:00	2024-12-14 00:09:12.535667
9	Zombie Uprising	Survive the undead apocalypse by scavenging for resources, building defenses, and fighting off hordes of zombies.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{Survival,Horror,Action}	{Windows,PlayStation,Xbox}	Apocalypse Games	DeadCore Studios	2024-10-12 00:00:00	2024-12-14 00:09:34.328543
10	Pixel Quest	Embark on a nostalgic adventure through pixelated worlds, solving puzzles and battling retro-inspired enemies.	http://138.124.29.185/photos/frog.jpg	{http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg,http://138.124.29.185/photos/frog.jpg}	{Platformer,Adventure,Retro}	{Windows,macOS,"Nintendo Switch"}	RetroWave	PixelPerfect	2025-06-08 00:00:00	2024-12-14 00:09:40.442631
\.


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nfagames
--

SELECT pg_catalog.setval('public.games_id_seq', 10, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: nfagames
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: ix_games_id; Type: INDEX; Schema: public; Owner: nfagames
--

CREATE INDEX ix_games_id ON public.games USING btree (id);


--
-- Name: ix_games_title; Type: INDEX; Schema: public; Owner: nfagames
--

CREATE UNIQUE INDEX ix_games_title ON public.games USING btree (title);


--
-- PostgreSQL database dump complete
--

