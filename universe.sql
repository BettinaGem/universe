
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id bigint NOT NULL,
    name character varying(20) NOT NULL,
    orbitalperiod integer
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying(20) NOT NULL,
    distance_in_years integer,
    magnitude numeric,
    origin_of_name text,
    year_of_discovery integer,
    detectable_with_telescope boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying(20) NOT NULL,
    size integer,
    year_of_discovery integer,
    radius integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying(20) NOT NULL,
    mass numeric,
    nummer_of_moons integer,
    detectable_with_telescope boolean NOT NULL,
    size_to_earth integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying(20) NOT NULL,
    detectable_with_telescope boolean NOT NULL,
    year_of_discovery integer,
    magnitude numeric,
    distance_in_years integer,
    mass numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'Panstarrs', 7);
INSERT INTO public.comets VALUES (2, 'Atlas', 66);
INSERT INTO public.comets VALUES (3, 'Gibbs', 20);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 0, 6.1, 'von Latin', NULL, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3, 3.44, 'Princess in greek mythology', 964, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, 5.77, 'Konstallitation', 1654, true);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 500, 15.2, 'form', 1941, false);
INSERT INTO public.galaxy VALUES (5, 'Sculptor', 11, 8, 'form', 1783, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 11, 6.84, NULL, 1826, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (16, 'Triton', 2705, 1846, 354759, NULL);
INSERT INTO public.moon VALUES (17, 'Proteus', 420, 1989, 117646, NULL);
INSERT INTO public.moon VALUES (18, 'Charon', 1212, 1979, 17536, NULL);
INSERT INTO public.moon VALUES (1, 'Io', 3643, 1610, 421800, 1);
INSERT INTO public.moon VALUES (2, 'Europe', 3121, 1610, 671100, 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5268, 1610, 1070400, 1);
INSERT INTO public.moon VALUES (4, 'Callisto', 4820, 1610, 1882700, 1);
INSERT INTO public.moon VALUES (6, 'Amalthea', 167, 1892, 181400, 1);
INSERT INTO public.moon VALUES (7, 'Himalia', 139, 1904, 11440600, 1);
INSERT INTO public.moon VALUES (5, 'Titan', 5450, 1655, 1221930, 2);
INSERT INTO public.moon VALUES (8, 'Rhea', 1527, 1672, 527108, 2);
INSERT INTO public.moon VALUES (9, 'Iapetus', 1468, 1671, 3560820, 2);
INSERT INTO public.moon VALUES (10, 'Dione', 1123, 1684, 377396, 2);
INSERT INTO public.moon VALUES (11, 'Tethys', 1063, 1684, 294618, 2);
INSERT INTO public.moon VALUES (19, 'Enceladus', 504, 1789, 237950, 2);
INSERT INTO public.moon VALUES (20, 'Mimas', 396, 1789, 185404, 2);
INSERT INTO public.moon VALUES (12, 'Titania', 1056, 1787, 435910, 3);
INSERT INTO public.moon VALUES (13, 'Oberon', 1522, 1787, 583520, 3);
INSERT INTO public.moon VALUES (14, 'Phobos', 23, 1877, 9377, 4);
INSERT INTO public.moon VALUES (15, 'Deimos', 12, 1877, 23460, 4);
INSERT INTO public.moon VALUES (21, 'Luna', 3474, NULL, 384400, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 69911, 92, true, 318, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 120536, 145, true, 95, 1);
INSERT INTO public.planet VALUES (3, 'Uranus', 25362, 27, false, 14, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6750, 2, true, 0, 1);
INSERT INTO public.planet VALUES (5, 'Earth', 6371, 1, true, 1, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 12103, 0, true, 1, 1);
INSERT INTO public.planet VALUES (7, 'Merkur', 4879, 0, false, 0, 1);
INSERT INTO public.planet VALUES (8, 'Neptun', 49528, 14, true, 17, 1);
INSERT INTO public.planet VALUES (9, 'Spe', NULL, NULL, false, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Arion', NULL, NULL, false, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Lipperhey', NULL, NULL, false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Pirx', NULL, NULL, false, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Hypatia', NULL, NULL, false, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'AEgir', NULL, NULL, false, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, NULL, 4.83, 1, 332, 1);
INSERT INTO public.star VALUES (2, 'Dubhe A', true, NULL, NULL, 124, 4, NULL);
INSERT INTO public.star VALUES (3, 'Alioth', true, NULL, NULL, 82, 2.8, NULL);
INSERT INTO public.star VALUES (4, 'Phecda', true, NULL, NULL, 83, 3, NULL);
INSERT INTO public.star VALUES (5, 'Merak', true, NULL, NULL, 79, 3, NULL);
INSERT INTO public.star VALUES (6, 'HD89744', true, NULL, NULL, 129, 2, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comets comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

