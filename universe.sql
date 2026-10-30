--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_types character varying(50) NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    is_spherical boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
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
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
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
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_types character varying(50),
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
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
-- Name: space_missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_missions (
    space_missions_id integer NOT NULL,
    name character varying(100) NOT NULL,
    destination character varying(50) NOT NULL,
    launch_year integer,
    successful boolean NOT NULL,
    description text
);


ALTER TABLE public.space_missions OWNER TO freecodecamp;

--
-- Name: space_missions_space_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_missions_space_missions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_missions_space_missions_id_seq OWNER TO freecodecamp;

--
-- Name: space_missions_space_missions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_missions_space_missions_id_seq OWNED BY public.space_missions.space_missions_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    temperature integer,
    is_visible boolean NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
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
-- Name: space_missions space_missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions ALTER COLUMN space_missions_id SET DEFAULT nextval('public.space_missions_space_missions_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 13600, false, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 10000, false, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000, 12000, false, 'A member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 13000, false, 'A famous interacting galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000000, 13000, true, 'A galaxy with a bright central bulge');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21000000, 12000, false, 'A face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 4500, false, true, 'Earth natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 4500, false, false, 'Inner moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 4500, false, false, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 4500, false, true, 'Volcanically active moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4500, false, true, 'Icy moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 4500, false, true, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4500, false, true, 'Heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 4500, false, false, 'Small irregular moon of Jupiter');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 4500, false, true, 'Moon of Saturn with methane lakes');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 4500, false, true, 'Icy moon with water geysers');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 4500, false, true, 'Moon of Saturn with a large crater');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 4500, false, true, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 4500, false, true, 'Moon with contrasting hemispheres');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 4500, false, true, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 4500, false, true, 'Moon of Saturn');
INSERT INTO public.moon VALUES (16, 'Titania', 7, 4500, false, true, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 4500, false, true, 'Outer major moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 4500, false, true, 'Dark moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 4500, false, true, 'Bright moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Miranda', 7, 4500, false, true, 'Moon of Uranus with unusual terrain');
INSERT INTO public.moon VALUES (21, 'Triton', 8, 4500, false, true, 'Largest moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, 77000000, 'Smallest planet in the solar system');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, 41000000, 'Hottest planet in the solar system');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, 0, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, 78000000, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, 628000000, 'Largest planet in the solar system');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, 1275000000, 'Famous for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, 2723000000, 'An ice giant with a tilted rotation');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, 4350000000, 'The farthest known planet from the Sun');
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 'Exoplanet', false, 5870000000000000, 'An exoplanet in the habitable zone');
INSERT INTO public.planet VALUES (10, 'Proxima b', 4, 'Exoplanet', false, 40000000000000, 'An exoplanet orbiting Proxima Centauri');
INSERT INTO public.planet VALUES (11, 'Vega b', 5, 'Exoplanet', false, 250000000000000, 'A fictional example of a planet candidate');
INSERT INTO public.planet VALUES (12, 'Rigel b', 6, 'Exoplanet', false, 860000000000000, 'A fictional example of an orbiting planet');


--
-- Data for Name: space_missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_missions VALUES (1, 'Apollo 11', 'Moon', 1969, true, 'First crewed Moon landing');
INSERT INTO public.space_missions VALUES (2, 'Voyager 1', 'Interstellar Space', 1977, true, 'Exploring beyond the solar system');
INSERT INTO public.space_missions VALUES (3, 'Mars Perseverance', 'Mars', 2020, true, 'Mars rover exploration');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, true, 'The star at the center of our solar system');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 9940, true, 'The brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 10000, 3500, true, 'A red supergiant star');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 4850, 3042, true, 'The closest known star to the Sun');
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, 9602, true, 'A bright star in the Lyra constellation');
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8000, 11000, true, 'A blue supergiant star');


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_missions_space_missions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_missions_space_missions_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_missions space_missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_name_key UNIQUE (name);


--
-- Name: space_missions space_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_pkey PRIMARY KEY (space_missions_id);


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

