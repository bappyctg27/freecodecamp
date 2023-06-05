--
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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth numeric,
    is_spherical boolean,
    has_life boolean,
    planet_id integer
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
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    description text,
    star_id integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_spherical boolean,
    age_inmillions_of_years integer,
    description text,
    galaxy_id integer
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy in which the Earth is located', false, 13000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way', false, 10000);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'A spiral galaxy with a distinctive shape', false, 500);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'A galaxy with a prominent dust lane', false, 2000);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'A peciluiar galxy with an active galactic nucleus', false, 1200);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'A grand design spiral galaxy', false, 400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Earths natural satelite', 384400, true, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer moon of the Mars', 9377, true, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The salller and farther moon of the Mars', 23460, true, false, 2);
INSERT INTO public.moon VALUES (4, 'Charon', 'Plutos largest moon', 17536, true, false, 9);
INSERT INTO public.moon VALUES (5, 'Triton', 'Neptunes largest moon', 354759, true, false, 6);
INSERT INTO public.moon VALUES (6, 'Io', 'one of the Jupiters moon', 421700, true, false, 3);
INSERT INTO public.moon VALUES (7, 'Europa', ' One of Jupiters moon', 671034, true, false, 3);
INSERT INTO public.moon VALUES (8, 'Ganymede', 'One of the Jupiters moon', 1070400, true, false, 3);
INSERT INTO public.moon VALUES (9, 'Callisto', 'One of the Jupiters moon', 1882700, true, false, 3);
INSERT INTO public.moon VALUES (10, 'Titan', 'Saturns largest moon', 1221870, true, false, 4);
INSERT INTO public.moon VALUES (11, 'Miranda', 'One of Uranus moon', 129390, true, false, 7);
INSERT INTO public.moon VALUES (12, 'Proteus', ' one of Neptunes moon', 117647, true, false, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 'One oof the Saturns moon', 294660, true, false, 4);
INSERT INTO public.moon VALUES (14, 'Dione', 'One of Saturns moon', 377400, true, false, 4);
INSERT INTO public.moon VALUES (15, 'Nereid', 'One of Neptunes moons', 5513400, true, false, 6);
INSERT INTO public.moon VALUES (16, 'Encledus', 'One of Saturns moon', 237948, true, false, 4);
INSERT INTO public.moon VALUES (17, 'Rhea', 'One of Saturns moons', 527108, true, false, 4);
INSERT INTO public.moon VALUES (18, 'Ariel', 'One of Uranus moon', 191020, true, false, 7);
INSERT INTO public.moon VALUES (19, 'Hyperion', 'One of Saturns moons', 1481100, true, false, 4);
INSERT INTO public.moon VALUES (20, 'Titania', 'One of Uranus moons', 436300, true, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'EARTH', 4500, 149.6, true, 'A Blue Oasis in the vastness of spaces', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4000, 227.9, false, 'A cold, dry, and dusty world with a thin atmosphere', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4500, 778.6, false, 'A giant gas planet with a Great Red Spot and many moons.', 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 4000, 1433.5, false, 'A gas giant with rings', 2);
INSERT INTO public.planet VALUES (5, 'Venus', 4000, 108.2, false, 'A hellish world with a thick atmosphere and sorching temperatures', 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 4500, 4495.1, false, 'A dark, cold, and windy ice giant', 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 4000, 2871.0, false, 'A blue green ice giantwith a unique sideways tilt', 2);
INSERT INTO public.planet VALUES (8, 'Mercury', 4000, 57.9, false, 'The Smallest and hottest planet in the solar ssystem', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4000, 5906.4, false, 'A small icy dwarf planet in the Kuiper Belt', 2);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 6000, 1402.3, false, 'A Rocky Super Earth in the habitable zone', 3);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 2000, 150.7, false, 'The first transitioning exoplanet discoveredorbiting a solar type star', 4);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 1000, 20.4, false, 'A potentially habitable Earth sized planet orbiting a red swarf star.', 4);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (6, 'Terrestrrial', 'Rocky planets similar to earth', 1, 1);
INSERT INTO public.planet_types VALUES (7, 'Gas giant', 'Large planets primarily composed of gas', 2, 3);
INSERT INTO public.planet_types VALUES (8, 'Ice Giant', 'Planets with a thick atmosphere and icy composition', 2, 4);
INSERT INTO public.planet_types VALUES (9, 'Dwarf Planet', 'Small celestial bodies that are not considered full fledged planets', 3, 6);
INSERT INTO public.planet_types VALUES (10, 'Exoplanet', 'Planets orbitting stars outside of our solar system', 4, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', true, 4600, 'THE STAR AT THE CENTER OF OUR SOLAR SYSTEM', 1);
INSERT INTO public.star VALUES (2, 'BETELGEUSE', false, 8000, 'a RED SUPERGIANT STAR IN THE CONSTELLATION ORIGIN', 1);
INSERT INTO public.star VALUES (3, 'SIRIUS', false, 250, 'THE BRIGHTEST STAR IN THE NIGHT SKY', 1);
INSERT INTO public.star VALUES (4, 'ALPHA CENTAURI', false, 6000, 'THE CLOSEST STAR SYSTEM TO THE SOLAR SYSTEM', 1);
INSERT INTO public.star VALUES (5, 'POLARIS', false, 700, 'THE NORTH STAR, USED FOR NAVIGATION', 1);
INSERT INTO public.star VALUES (6, 'ANTARES', false, 12000, 'A RED SUPERGIANT STAR IN THE CONSTELLATION SCORPIUS', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_desc_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_desc_name UNIQUE (name);


--
-- Name: planet_types unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fk_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fk_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet_types planet_types_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_types planet_types_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_fk_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fk_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


