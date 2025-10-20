import 'package:flutter_dotenv/flutter_dotenv.dart';

var apikey = dotenv.env['API_KEY'];
var baseApiUrl="http://www.omdbapi.com/?apikey=$apikey&";
const filmes = [
  "matilda",
  "addams family",
  "hocus pocus",
  "scream",
  "ghostbusters",
  "practical magic",
  "wendell wild",
  "nightmare before christmas",
  "corpse bride",
  "beetlejuice",
  "the witches",
  "mistress of the dark",
  "child's play",
  "a nightmare on elm street",
  "monster house",
  "frankenstein",
  "halloween"
];
