--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    num_of_galaxies integer NOT NULL,
    num_of_stars integer NOT NULL,
    num_of_planets integer NOT NULL,
    num_of_moons integer NOT NULL,
    has_black_holes boolean NOT NULL,
    has_habitable_planets boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    size numeric,
    shape text,
    has_black_hole boolean NOT NULL,
    num_stars integer
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
    name character varying NOT NULL,
    type character varying,
    distance_from_planet numeric,
    is_in_habitable_zone boolean NOT NULL,
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
    name character varying NOT NULL,
    type character varying,
    size numeric,
    has_moons boolean NOT NULL,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    type character varying,
    luminosity integer,
    has_planets boolean NOT NULL,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Example Constellation 1', 'This is an example constellation that meets all conditions.', 6, 20, 36, 60, true, true);
INSERT INTO public.constellation VALUES (2, 'Example Constellation 2', 'Another example constellation.', 7, 25, 40, 65, false, true);
INSERT INTO public.constellation VALUES (3, 'Example Constellation 3', 'Yet another example constellation.', 8, 30, 45, 70, true, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000, 'Spiral', true, 100000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1200000, 'Spiral', true, 200000000);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 1500000, 'Elliptical', true, 50000000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 800000, 'Spiral', false, 40000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 700000, 'Spiral', false, 30000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 600000, 'Spiral', false, 20000000);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 900000, 'Spiral', false, 40000000);
INSERT INTO public.galaxy VALUES (8, 'Messier 51', 850000, 'Spiral', false, 30000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'MoonEarth1', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (2, 'MoonJupiter1', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (3, 'MoonMars1', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (4, 'MoonSaturn1', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (5, 'MoonVenus1', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (6, 'MoonUranus1', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (7, 'MoonNeptune1', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (8, 'MoonMercury1', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (9, 'MoonPluto1', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (10, 'MoonKepler-452b1', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (11, 'MoonHD 189733b1', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (12, 'MoonWASP-12b1', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (13, 'MoonEarth2', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (14, 'MoonJupiter2', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (15, 'MoonMars2', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (16, 'MoonSaturn2', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (17, 'MoonVenus2', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (18, 'MoonUranus2', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (19, 'MoonNeptune2', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (20, 'MoonMercury2', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (21, 'MoonPluto2', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (22, 'MoonKepler-452b2', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (23, 'MoonHD 189733b2', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (24, 'MoonWASP-12b2', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (25, 'MoonEarth3', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (26, 'MoonJupiter3', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (27, 'MoonMars3', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (28, 'MoonSaturn3', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (29, 'MoonVenus3', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (30, 'MoonUranus3', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (31, 'MoonNeptune3', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (32, 'MoonMercury3', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (33, 'MoonPluto3', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (34, 'MoonKepler-452b3', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (35, 'MoonHD 189733b3', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (36, 'MoonWASP-12b3', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (37, 'MoonEarth4', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (38, 'MoonJupiter4', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (39, 'MoonMars4', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (40, 'MoonSaturn4', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (41, 'MoonVenus4', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (42, 'MoonUranus4', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (43, 'MoonNeptune4', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (44, 'MoonMercury4', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (45, 'MoonPluto4', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (46, 'MoonKepler-452b4', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (47, 'MoonHD 189733b4', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (48, 'MoonWASP-12b4', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (49, 'MoonEarth5', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (50, 'MoonJupiter5', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (51, 'MoonMars5', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (52, 'MoonSaturn5', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (53, 'MoonVenus5', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (54, 'MoonUranus5', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (55, 'MoonNeptune5', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (56, 'MoonMercury5', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (57, 'MoonPluto5', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (58, 'MoonKepler-452b5', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (59, 'MoonHD 189733b5', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (60, 'MoonWASP-12b5', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (61, 'MoonEarth6', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (62, 'MoonJupiter6', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (63, 'MoonMars6', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (64, 'MoonSaturn6', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (65, 'MoonVenus6', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (66, 'MoonUranus6', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (67, 'MoonNeptune6', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (68, 'MoonMercury6', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (69, 'MoonPluto6', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (70, 'MoonKepler-452b6', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (71, 'MoonHD 189733b6', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (72, 'MoonWASP-12b6', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (73, 'MoonEarth7', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (74, 'MoonJupiter7', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (75, 'MoonMars7', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (76, 'MoonSaturn7', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (77, 'MoonVenus7', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (78, 'MoonUranus7', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (79, 'MoonNeptune7', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (80, 'MoonMercury7', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (81, 'MoonPluto7', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (82, 'MoonKepler-452b7', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (83, 'MoonHD 189733b7', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (84, 'MoonWASP-12b7', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (85, 'MoonEarth8', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (86, 'MoonJupiter8', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (87, 'MoonMars8', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (88, 'MoonSaturn8', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (89, 'MoonVenus8', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (90, 'MoonUranus8', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (91, 'MoonNeptune8', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (92, 'MoonMercury8', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (93, 'MoonPluto8', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (94, 'MoonKepler-452b8', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (95, 'MoonHD 189733b8', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (96, 'MoonWASP-12b8', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (97, 'MoonEarth9', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (98, 'MoonJupiter9', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (99, 'MoonMars9', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (100, 'MoonSaturn9', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (101, 'MoonVenus9', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (102, 'MoonUranus9', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (103, 'MoonNeptune9', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (104, 'MoonMercury9', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (105, 'MoonPluto9', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (106, 'MoonKepler-452b9', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (107, 'MoonHD 189733b9', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (108, 'MoonWASP-12b9', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (109, 'MoonEarth10', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (110, 'MoonJupiter10', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (111, 'MoonMars10', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (112, 'MoonSaturn10', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (113, 'MoonVenus10', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (114, 'MoonUranus10', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (115, 'MoonNeptune10', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (116, 'MoonMercury10', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (117, 'MoonPluto10', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (118, 'MoonKepler-452b10', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (119, 'MoonHD 189733b10', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (120, 'MoonWASP-12b10', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (121, 'MoonEarth11', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (122, 'MoonJupiter11', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (123, 'MoonMars11', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (124, 'MoonSaturn11', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (125, 'MoonVenus11', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (126, 'MoonUranus11', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (127, 'MoonNeptune11', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (128, 'MoonMercury11', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (129, 'MoonPluto11', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (130, 'MoonKepler-452b11', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (131, 'MoonHD 189733b11', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (132, 'MoonWASP-12b11', 'Natural satellite', 1, false, 12);
INSERT INTO public.moon VALUES (133, 'MoonEarth12', 'Natural satellite', 1, false, 1);
INSERT INTO public.moon VALUES (134, 'MoonJupiter12', 'Natural satellite', 1, false, 2);
INSERT INTO public.moon VALUES (135, 'MoonMars12', 'Natural satellite', 1, false, 3);
INSERT INTO public.moon VALUES (136, 'MoonSaturn12', 'Natural satellite', 1, false, 4);
INSERT INTO public.moon VALUES (137, 'MoonVenus12', 'Natural satellite', 1, false, 5);
INSERT INTO public.moon VALUES (138, 'MoonUranus12', 'Natural satellite', 1, false, 6);
INSERT INTO public.moon VALUES (139, 'MoonNeptune12', 'Natural satellite', 1, false, 7);
INSERT INTO public.moon VALUES (140, 'MoonMercury12', 'Natural satellite', 1, false, 8);
INSERT INTO public.moon VALUES (141, 'MoonPluto12', 'Natural satellite', 1, false, 9);
INSERT INTO public.moon VALUES (142, 'MoonKepler-452b12', 'Natural satellite', 1, false, 10);
INSERT INTO public.moon VALUES (143, 'MoonHD 189733b12', 'Natural satellite', 1, false, 11);
INSERT INTO public.moon VALUES (144, 'MoonWASP-12b12', 'Natural satellite', 1, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 'Gas giant', 11, true, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 'Terrestrial', 0.1, true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas giant', 9, true, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 'Terrestrial', 0.9, true, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice giant', 4, true, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice giant', 3.8, true, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Terrestrial', 0.4, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 0.1, true, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Terrestrial', 1, true, 2);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 'Gas giant', 2.5, true, 2);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 'Hot Jupiter', 1.9, true, 2);
INSERT INTO public.planet VALUES (13, 'Kepler-186f', 'Terrestrial', 0.9, true, 3);
INSERT INTO public.planet VALUES (14, 'Gliese 581g', 'Terrestrial', 1.2, true, 3);
INSERT INTO public.planet VALUES (15, 'Trappist-1e', 'Terrestrial', 1.1, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red supergiant', 10000, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A-type', 25, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'M-type', 0, true, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'G-type', 2, true, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'K-type', 1, true, 1);
INSERT INTO public.star VALUES (7, 'Alpha Canum Venaticorum', 'A-type', 2, true, 2);
INSERT INTO public.star VALUES (8, 'Epsilon Eridani', 'K-type', 0, true, 2);
INSERT INTO public.star VALUES (9, 'Tau Ceti', 'G-type', 1, true, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 144, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

