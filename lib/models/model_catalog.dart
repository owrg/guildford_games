import 'package:flutter/foundation.dart';
import 'package:guildford_games/models/model_game.dart';


class GamesCatalogModel extends ChangeNotifier {
  static List<String> namesList = [];
  static List<Game> gamesList = [
  /*  Game(1,"Rummikub",2,4,8,"Table","Individual",1,30,"No","None","Numbers strategy","",['assets/images/games/rummikub_001.jpg']),
    Game(2,"Subbuteo",2,4,6,"Table","Teams",1,90,"No","Extra little players are hidden at the back","Dexterity football","",['assets/images/games/subbuteo_001.jpg']),
    Game(3,"Chess (Systema Jupiter)",1,2,8,"Table","Individual",1,30,"No","None","Classical strategy","",['assets/images/games/chess_001.jpg']),
    Game(4,"Monty Pythons Really Silly Board Game",2,6,14,"Table","Individual",1,60,"No","None","Action strategy","",['assets/images/games/montypythonsreallysillyboardgame_001.jpg']),
    Game(5,"Blockbusters",3,9,12,"Chairs","Teams",1,60,"No","None","General knowledge team","",['assets/images/games/blockbusters_001.jpg']),
    Game(6,"Countdown",3,5,8,"Chairs","Teams",1,60,"No","None","Word making and numbers","",['assets/images/games/countdown_001.jpg']),
    Game(7,"Play your cards right",3,5,6,"Chairs","Teams",1,60,"No","None","Strategic card turning","",['assets/images/games/playyourcardsright_001.jpg']),
    Game(8,"Family Fortunes",2,9,10,"Chairs","Teams",1,60,"No","None","General knowledge team","",['assets/images/games/familyfortunes_001.jpg']),
    Game(9,"Dingbats",2,4,8,"Chairs","Teams",1,30,"No","None","Cryptic Brain Teaser","",['assets/images/games/dingbats_001.jpg']),
    Game(10,"Get a grip",3,9,8,"Chairs","Individual",1,30,"No","None","Dexterity challenge","",['assets/images/games/getagrip_001.jpg']),
    Game(11,"Ten of a kind",2,9,14,"Chairs","Teams",1,30,"No","None","General knowledge team","Cross reference: Outburst",['assets/images/games/tenofakind_001.jpg']),
    Game(12,"Pass the bomb",2,9,12,"Chairs","Teams",1,30,"No","Batteries","Word making challenge","",['assets/images/games/passthebomb_001.jpg']),
    Game(13,"Campaign",2,4,12,"Table","Individual",1,60,"No","None","Military strategy","Cross reference: Risk",['assets/images/games/campaign_001.jpg','assets/images/games/campaign_002.jpg']),
    Game(14,"Million Pound Drop",2,9,12,"Table","Teams",1,30,"No","None","General knowledge team","",['assets/images/games/millionpounddrop_001.jpg']),
    Game(15,"Cover up",2,2,6,"Table","Individual",1,15,"No","None","Shape strategy","",['assets/images/games/coverup_001.jpg']),
    Game(16,"Battle of the Sexes",2,9,18,"Table","Teams",2,60,"No","None","Adult General knowledge","Provokes conversation",['assets/images/games/battleofthesexes_001.jpg']),
    Game(17,"QI The Board Game",3,6,12,"Table","Teams",2,60,"No","None","General knowledge team","",['assets/images/games/qitheboardgame_001.jpg']),
    Game(18,"The Cube",2,6,8,"Table","Teams",2,60,"No","None","Dexterity challenge","",['assets/images/games/thecube_001.jpg']),
    Game(19,"Pie Face",2,9,5,"Table","Individual",2,30,"No","Squirty Cream","Children's fun","",['assets/images/games/pieface_001.jpg']),
    Game(20,"Speedy Cups",2,6,4,"Table","Individual",2,15,"No","None","Children's fun Picture Matching","",['assets/images/games/speedycups_001.jpg']),
    Game(21,"Twist and Turn 4 in a row",2,2,3,"Table","Individual",2,15,"No","None","Children's fun patterns", "Cross reference: Connect 4",['assets/images/games/twistandturnturn_001.jpg']),
    Game(22,"Chessword",2,2,8,"Table","Individual",2,30,"No","None","Word strategy","Cross reference: Chess",['assets/images/games/chessword_001.jpg']),
    Game(23,"Pentago",2,2,8,"Table","Individual",2,15,"No","None","Pattern strategy","",['assets/images/games/pentago_001.jpg']),
    Game(24,"Cranium",4,8,12,"Table","Teams",2,60,"No","None","Team activity challenge","",['assets/images/games/cranium_001.jpg']),
    Game(25,"Chain Reaction",4,20,12,"Chairs","Teams",2,30,"No","None","Quick thinking","",['assets/images/games/chainreaction_001.jpg']),
    Game(26,"Balderdash (Absolute)",4,20,12,"Chairs","Individual",2,30,"No","None","Word definitions","",['assets/images/games/balderdash_001.jpg']),
    Game(27,"Colour Brain",2,20,14,"Chairs","Teams",2,30,"No","None","General knowledge team","",['assets/images/games/colourbrain_001.jpg']),
    Game(28,"Outburst",2,20,15,"Chairs","Teams",2,30,"No","None","General knowledge team","Cross reference: Ten of a kind",['assets/images/games/outburst_001.jpg']),
    Game(29,"Logo",2,6,12,"Chairs","Teams",2,30,"No","None","General knowledge team (Brands)","",['assets/images/games/logo_001.jpg']),
    Game(30,"Articulate",4,20,12,"Chairs","Teams",2,30,"No","None","General knowledge team","Cross reference: Taboo",['assets/images/games/articulate_001.jpg']),
    Game(31,"Champagne",2,20,8,"Table","Individual",1,15,"No","None","Dexterity challenge","",['assets/images/games/champagne_001.jpg']),
    Game(32,"5 Gold rings",3,9,8,"Table","Individual",1,30,"No","None","General knowledge","",['assets/images/games/5goldrings_001.jpg']),
    Game(33,"Smart Ass",2,8,12,"Chairs","Individual",1,30,"No","Additional cards in separate tin","General knowledge","",['assets/images/games/smartass_001.jpg']),
    Game(34,"Battleship Command",2,2,8,"Table","Individual",2,30,"No","None","Military strategy","",['assets/images/games/battleships_001.jpg']),
    Game(35,"Connect 4",2,2,8,"Table","Individual",7,15,"No","None","Pattern strategy","",['assets/images/games/connect4_001.jpg']),
    Game(36,"Downfall",2,2,8,"Table","Individual",7,15,"No","None","Pattern strategy","",['assets/images/games/downfall_001.jpg','assets/images/games/downfall_002.jpg']),
    Game(37,"Game of Life",2,6,8,"Table","Individual",1,60,"No","None","Life story strategy","",['assets/images/games/gameoflife_001.jpg']),
    Game(38,"Ulcers",2,4,9,"Table","Individual",3,60,"No","None","Fun business game","",['assets/images/games/ulcers_001.jpg']),
    Game(39,"Blast-Off",1,4,8,"Table","Individual",3,60,"No","None","Space strategy","",['assets/images/games/blastoff_001.jpg']),
    Game(40,"Cluedo",3,6,8,"Table","Individual",3,60,"No","None","Detective","",['assets/images/games/cluedo_001.jpg']),
    Game(41,"Sorry",2,4,5,"Table","Individual",3,30,"No","None","Meeple race","Cross reference: Ludo",['assets/images/games/sorry_001.jpg']),
    Game(42,"Monopoly",2,6,8,"Table","Individual",3,120,"No","None","Fun business game","",['assets/images/games/monopoly_001.jpg']),
    Game(43,"Monopoly (Junior)",2,4,5,"Table","Individual",3,30,"No","None","Fun business game","",['assets/images/games/monopolyjunior_001.jpg']),
    Game(44,"Knock'em out",2,2,7,"Table","Individual",3,15,"No","None","Shape strategy","Cross reference: Connect 4",['assets/images/games/knockemout_001.jpg']),
    Game(45,"Mouse Trap",1,4,8,"Table","Individual",3,30,"No","None","Meeple race","",['assets/images/games/mousetrap_001.jpg']),
    Game(46,"Poleconomy",2,6,10,"Table","Individual",3,90,"No","None","Fun business game","",['assets/images/games/poleconomy_001.jpg']),
    Game(47,"Business Game",2,6,10,"Table","Individual",3,90,"No","None","Mining Business Strategy","",['assets/images/games/businessgame_001.jpg','assets/images/games/businessgame_002.jpg']),
    Game(48,"Totopoly",2,9,10,"Table","Individual",3,90,"No","None","Racing strategy","",['assets/images/games/totopoly_001.jpg']),
    Game(49,"Risk",3,6,10,"Table","Individual",3,90,"No","None","Military strategy","",['assets/images/games/risk_001.jpg']),
    Game(50,"Go (Travel)",2,6,10,"Table","Individual",3,60,"No","None","World travel strategy","",['assets/images/games/go_001.jpg','assets/images/games/go_002.jpg']),
    Game(51,"Escalado",2,5,6,"Table","Individual",3,60,"No","Table","Horse racing and betting","",['assets/images/games/escalado_001.jpg']),
    Game(52,"Genius",2,2,12,"Table","Teams",3,60,"No","None","General knowledge","",['assets/images/games/genius_001.jpg','assets/images/games/genius_002.jpg']),
    Game(53,"Take the brain",2,2,8,"Table","Individual",3,30,"No","None","Strategy","Cross reference: Chess",['assets/images/games/takethebrain_001.jpg']),
    Game(54,"Ratrace",2,6,9,"Table","Individual",3,60,"No","None","Meeple race","",['assets/images/games/ratrace_001.jpg']),
    Game(55,"Scotland Yard",3,6,10,"Table","Individual",3,60,"No","None","Detective - Coop","",['assets/images/games/scotlandyard_001.jpg','assets/images/games/scotlandyard_002.jpg']),
    Game(56,"Triominoes",2,6,7,"Table","Individual",2,30,"No","None","Detective - Coop","Cross reference: Dominoes",['assets/images/games/triominoes_001.jpg']),
    Game(57,"Journey through Europe",2,6,10,"Table","Individual",3,60,"No","None","Travel strategy","",['assets/images/games/journeythrougheurope_001.jpg']),
    Game(58,"September",2,4,4,"Table","Individual",3,30,"No","None","Shape strategy","",['assets/images/games/september_001.jpg']),
    Game(59,"Kensington",2,6,7,"Table","Individual",3,30,"No","None","Shape strategy","",['assets/images/games/kensington_001.jpg','assets/images/games/kensington_002.jpg','assets/images/games/kensington_003.jpg','assets/images/games/kensington_004.jpg']),
    Game(60,"Mid Life crisis",2,6,18,"Table","Individual",3,30,"No","None","Adult Strategy","",['assets/images/games/midlifecrisis_001.jpg']),
    Game(61,"Labyrinth",1,20,6,"Chairs","Teams",3,15,"No","None","Dexterity challenge","",['assets/images/awaitingimage.png']),
    Game(62,"Frustration",2,4,4,"Table","Individual",3,15,"No","None","Meeple race","Cross reference: Ludo",['assets/images/games/frustration_001.jpg']),
    Game(63,"Hangman",2,2,8,"Table","Individual",3,15,"No","None","Word guessing","",['assets/images/games/hangman_001.jpg']),
    Game(64,"Scrabble",2,4,8,"Table","Individual",5,15,"No","None","Word strategy","Spare board and tiles are kept closeby",['assets/images/games/scrabble_001.jpg','assets/images/games/scrabble_002.jpg']),
    Game(65,"Scrabble (Junior)",2,4,5,"Table","Individual",5,15,"No","None","Childrens Word strategy","",['assets/images/games/scrabblejunior_01.jpg']),
    Game(66,"Quandary",2,2,10,"Table","Individual",5,15,"No","None","Strategy","Cross reference: Chess",['assets/images/games/quandary_001.jpg']),
    Game(67,"Bedlam",4,8,8,"Table","Individual",5,15,"No","None","Set gathering race","Cross reference: Pit",['assets/images/games/bedlam_001.jpg','assets/images/games/bedlam_002.jpg']),
    Game(68,"Bluffoons",2,6,8,"Table","Individual",5,15,"No","None","Bluffing","",['assets/images/games/bluffoons_001.jpg','assets/images/games/bluffoons_002.jpg']),
    Game(69,"Perudo",2,6,8,"Table","Individual",5,15,"No","None","Dice bluffing","Missing pieces, but enough to play""",['assets/images/games/perudo_001.jpg']),
    Game(70,"Mancala",2,2,7,"Table","Individual",5,15,"No","None","Strategy","",['assets/images/games/mancala_001.jpg']),
    Game(71,"Hazard",2,2,8,"Table","Individual",5,15,"No","None","Strategy","",['assets/images/games/hazard_001.jpg']),
    Game(72,"Telestrations",4,8,8,"Chairs","Individual",5,30,"No","None","Drawing madness","",['assets/images/games/telestrations_001.jpg']),
    Game(73,"Mastermind",2,2,8,"Table","Individual",5,15,"No","None","Logic","",['assets/images/games/mastermind_001.jpg']),
    Game(74,"Twister",2,4,6,"Chairs","Individual",5,10,"No","Floor","Physical Dexterity","",['assets/images/games/twister_001.jpg','assets/images/games/twister_002.jpg']),
    Game(75,"Get a letter",2,2,8,"Table","Teams",5,15,"No","Batteries (3 x AAA)","Word strategy","",['assets/images/awaitingimage.png']),
    Game(76,"Numbers Up",2,4,6,"Table","Individual",5,15,"No","None","Dice strategy","",['assets/images/games/numbersup_001.jpg']),
    Game(77,"Scoop",2,4,8,"Table","Individual",5,30,"No","None","Fun business game","",['assets/images/games/scoop_001.jpg']),
    Game(78,"Yahtzee",2,8,8,"Table","Individual",5,15,"No","None","Dice strategy","",['assets/images/games/yahtzee_001.jpg']),
    Game(79,"Where is Moldolva",2,4,9,"Table","Individual",5,45,"No","None","Geography","",['assets/images/games/whereismoldova_001.jpg']),
    Game(80,"Payday",2,6,8,"Table","Individual",5,60,"No","None","Life story strategy","",['assets/images/games/payday_001.jpg']),
    Game(81,"Ticket to Ride (Europe)",2,5,8,"Table","Individual",5,60,"No","None","Train objective collection","",['assets/images/games/tickettorideeurope_001.jpg']),
    Game(82,"Taboo",4,9,12,"Chairs","Teams",5,40,"No","None","Word description","",['assets/images/games/taboo_001.jpg']),
    Game(83,"Taboo Quick Draw",4,9,8,"Chairs","Teams",5,40,"No","None","Drawing madness","",['assets/images/games/tabooqucikdraw_001.jpg']),
    Game(84,"Sequence",2,3,7,"Table","Teams",5,30,"No","None","Card strategy","",['assets/images/games/sequence_001.jpg']),
    Game(85,"Spite",3,6,8,"Table","Individual",5,60,"No","None","Dice strategy","",['assets/images/games/spite_001.jpg']),
    Game(86,"Last Word",2,8,8,"Table","Individual",5,30,"No","Batteries (3 x AAA)","Word knowledge race","Cross reference: Pass the Bomb",['assets/images/games/lastword_001.jpg']),
    Game(87,"Black Box",2,2,8,"Table","Individual",5,30,"No","None","Strategy","Cross reference: Battleships",['assets/images/games/blackbox_001.jpg','assets/images/games/blackbox_002.jpg']),
    Game(88,"Brain Strain",2,2,8,"Table","Teams",5,30,"No","None","Lateral thinking puzzle","",['assets/images/games/brainstrain_001.jpg']),
    Game(89,"Visual Brain Storms",1,9,11,"Chairs","Teams",5,40,"No","Pencil Paper","Lateral thinking puzzle","",['assets/images/games/visualbrainstorms_001.jpg']),
    Game(90,"Beetle Game",2,4,4,"Chairs","Individual",5,15,"No","None","Dice Luck","",['assets/images/games/beetle_001.jpg']),
    Game(91,"Yes No Game",2,6,8,"Table","Individual",5,15,"No","None","Quick thinking","",['assets/images/games/yesno_001.jpg']),
    Game(92,"Codswallop",4,9,14,"Chairs","Teams",5,30,"No","None","Bluffing","Cross reference: Balderdash",['assets/images/games/codswallop_001.jpg']),
    Game(93,"Excuses",2,6,12,"Chairs","Individual",5,20,"No","None","Select and vote","Cross reference: Cards against humanity",['assets/images/games/excuses_001.jpg']),
    Game(94,"Mind Trap",2,8,12,"Chairs","Teams",5,30,"No","None","Lateral thinking puzzle","Cross reference: Dingbats",['assets/images/games/mindtrap_001.jpg']),
    Game(95,"Match of the Day",2,6,12,"Chairs","Individual",5,15,"No","None","Football Trivia","",['assets/images/games/matchoftheday_001.jpg']),
    Game(96,"Password",3,4,10,"Chairs","Individual",5,30,"No","None","Guess the word","Cross reference: Taboo",['assets/images/games/password_001.jpg']),
    Game(97,"Boggle",1,8,8,"Table","Individual",5,30,"No","Pencil Paper","Find words","",['assets/images/games/boggle_001.jpg']),
    Game(98,"Da Vinci Code",2,4,7,"Table","Individual",5,15,"No","None","Detective","",['assets/images/games/davincicode_001.jpg']),
    Game(99,"Scrambled Eggs",2,6,8,"Table","Individual",5,15,"No","None","Word making race","",['assets/images/games/scrambledeggs_001.jpg']),
    Game(100,"Sting",2,6,9,"Table","Individual",5,30,"No","None","Word making race","Cross reference: Uno / Rummy",['assets/images/games/sting_001.jpg']),
    Game(101,"Ins and Outs",2,2,7,"Table","Individual",5,15,"No","None","Strategy race","",['assets/images/games/insandouts_001.jpg']),
    Game(102,"3-a-side",2,2,7,"Table","Individual",5,15,"No","None","Football strategy","",['assets/images/games/3aside_001.jpg']),
    Game(103,"Jenga",1,9,7,"Table","Individual",4,15,"No","Table","Dexterity","",['assets/images/games/jenga_001.jpg']),
    Game(104,"Kick-off",2,4,7,"Table","Individual",4,15,"No","None","Football strategy","",['assets/images/games/kickoff_001.jpg']),
    Game(105,"Lotto (Housey housey)",2,12,7,"Table","Individual",4,15,"No","None","Luck","Cross reference: Bingo",['assets/images/games/lotto_001.jpg']),
    Game(106,"Pick-it",2,4,8,"Table","Individual",4,15,"No","None","Shape strategy","",['assets/images/games/pickit_001.jpg']),
    Game(107,"After Dinner Arguments",4,8,18,"Chairs","Teams",4,15,"No","None","Adult discussion","",['assets/images/games/afterdinnerarguments_001.jpg']),
    Game(108,"Pass the Pigs",2,6,8,"Table","Individual",4,15,"No","None","Dice Luck","",['assets/images/games/passthepigs_001.jpg','assets/images/games/passthepigs_002.jpg','assets/images/games/passthepigs_003.jpg']),
    Game(109,"Go Wild",2,6,10,"Table","Individual",4,30,"No","None","Trick winning","",['assets/images/games/gowild_001.jpg']),
    Game(110,"Skip-Bo",2,6,7,"Table","Individual",4,30,"No","None","Card strategy","",['assets/images/games/skipbo_001.jpg']),
    Game(111,"Uno",2,10,7,"Table","Individual",4,30,"No","None","Card strategy","",['assets/images/games/uno_001.jpg']),
    Game(112,"Lexicon",2,4,7,"Table","Individual",4,30,"No","None","Word making","Cross reference: Scrambled eggs",['assets/images/games/lexicon_001.jpg']),
    Game(113,"Kan-u-go",1,7,8,"Table","Individual",4,30,"No","None","Crossword strategy","Cross reference: Scrabble",['assets/images/games/kanugo_001.jpg']),
    Game(114,"Continuo",1,5,7,"Table","Individual",4,30,"No","None","Shape strategy","",['assets/images/games/continuo_001.jpg']),
    Game(115,"Piggy",2,10,7,"Table","Individual",4,30,"No","None","Card collecting","",['assets/images/games/piggy_001.jpg']),
    Game(116,"Clash",2,2,8,"Table","Individual",4,15,"No","None","Strategy","Cross reference: Chess",['assets/images/games/clash_001.jpg']),
    Game(117,"Game of Gnomes",2,4,6,"Table","Individual",4,15,"No","None","Fast thinking","",['assets/images/games/gameofgnomes_001.jpg']),
    Game(118,"Ghost Blitz",2,8,8,"Table","Individual",4,30,"No","None","Fast thinking","",['assets/images/games/ghostblitz_001.jpg']),
    Game(119,"Pit",3,6,8,"Table","Individual",4,30,"No","None","Card collecting","",['assets/images/games/pit_001.jpg']),
    Game(120,"Skull",3,6,10,"Table","Individual",4,30,"No","None","Bluffing","",['assets/images/games/skull_001.jpg']),
    Game(121,"Fluxx",2,6,8,"Table","Individual",4,30,"No","None","Card collecting","",['assets/images/games/flux_001.jpg']),
    Game(122,"Contraband",3,8,8,"Table","Individual",4,30,"No","None","Bluffing","",['assets/images/games/contraband_001.jpg']),
    Game(123,"The Mind",2,4,8,"Table","Individual",4,20,"No","None","Coop strategy","",['assets/images/games/themind_001.jpg']),
    Game(124,"Hanabi",2,5,8,"Table","Individual",4,30,"No","None","Coop strategy","",['assets/images/games/hanabi_001.jpg']),
    Game(125,"Codenames",2,8,10,"Table","Teams",4,15,"No","None","Code guessing","",['assets/images/games/codenames_001.jpg']),
    Game(126,"Illusion",2,5,8,"Table","Individual",4,15,"No","None","Colour guessing","",['assets/images/games/illusion_001.jpg']),
    Game(127,"Hummbug",2,4,12,"Table","Teams",4,15,"No","None","Music guessing","",['assets/images/games/hummbug_001.jpg']),
    Game(128,"Man bites dog",2,6,8,"Chairs","Individual",4,15,"No","None","Select and vote","",['assets/images/games/manbitesdog_001.jpg']),
    Game(129,"Odds On",2,5,8,"Table","Individual",4,15,"No","None","Horse racing and betting","",['assets/images/games/oddson_001.jpg']),
    Game(130,"3 up 3 down",2,6,7,"Chairs","Individual",4,10,"No","None","Card strategy","",['assets/images/games/3up3down_001.jpg']),
    Game(131,"Blockbusters (Gold Run)",2,2,12,"Table","Individual",4,15,"No","None","General Knowledge","",['assets/images/games/blockbustersgoldrun_001.jpg']),
    Game(132,"Scattegories (Small version)",2,6,8,"Chairs","Teams",4,15,"No","None","Word game","",['assets/images/games/scattergories_001.jpg']),
    Game(133,"Punderdome",3,8,12,"Chairs","Teams",4,15,"No","None","Word game","",['assets/images/games/punderdome_001.jpg']),
    Game(134,"Dominoes",2,4,8,"Table","Individual",4,15,"No","None","Number matching","",['assets/images/games/dominoes_001.jpg']),
    Game(135,"Dominoes (Childrens)",2,4,8,"Table","Individual",4,15,"No","None","Number matching","",['assets/images/games/dominoeschildrens_001.jpg','assets/images/games/dominoeschildrens_002.jpg']),
    Game(136,"Pecking Order",2,8,8,"Chairs","Teams",4,30,"No","None","Ordering","",['assets/images/games/peckingorder_001.jpg']),
    Game(137,"Strike Off",2,8,8,"Chairs","Teams",4,30,"No","None","General knowledge","",['assets/images/games/strikeoff_001.jpg']),
    Game(138,"Lose your letters",2,8,8,"Chairs","Teams",4,15,"No","None","General knowledge","Cross reference: Get a letter",['assets/images/games/loseyourletters_001.jpg']),
    Game(139,"Butt Head",2,2,4,"Chairs","Individual",4,15,"No","None","Dexterity catching","Cross reference: Butthead",['assets/images/games/butthead_002.jpg']),
    Game(140,"Butthead",2,2,4,"Chairs","Individual",4,15,"No","None","Dexterity catching","Cross reference: Butt head",['assets/images/games/butthead_001.jpg']),
    Game(141,"True or False",3,8,14,"Chairs","Teams",4,30,"No","None","General knowledge","",['assets/images/games/trueorfalse_001.jpg']),
    Game(142,"How to Host a Murder (Hollywood premiere of Powar and Greed)",9,20,18,"Chairs","Teams",4,180,"No","None","Dinner party detective","",['assets/images/games/howtohostamurder_001.jpg','assets/images/games/howtohostamurder_002.jpg']),
    Game(143,"Dobble",2,8,6,"Table","Individual",4,15,"No","None","Fast thinking","",['assets/images/games/dobble_001.jpg']),
    Game(144,"Games of Fortune (Roulette wheel)",3,8,6,"Table","Individual",4,30,"No","None","Luck","",['assets/images/games/gamesoffortune_001.jpg']),
    Game(145,"Magnetic Compendium (7 games in 1)",2,2,8,"Table","Individual",4,30,"Yes","None","Strategy","Cross reference: Chess, Checkers, Backgammon, Cribbage, Dominoes. Playing Cards, Poker dice",['assets/images/games/magnetictravelgames_001.jpg']),
    Game(146,"Ludo Snakes and Ladders",2,4,8,"Table","Individual",4,30,"Yes","None","Meeple race","",['assets/images/games/ludosnakesandladders_001.jpg']),
    Game(147,"Magnetic Ludo",2,4,8,"Table","Individual",4,30,"Yes","None","Meeple race","",['assets/images/games/magneticludo_001.jpg']),
    Game(148,"Magnetic Checkers",2,2,8,"Table","Individual",4,30,"Yes","None","Strategy","",['assets/images/games/magneticcheckers_001.jpg']),
    Game(149,"Chinese Checkers",3,3,6,"Table","Individual",4,30,"Yes","None","Strategy","",['assets/images/games/chinesecheckers_001.jpg']),
    Game(150,"Nine Mens Morris",2,2,6,"Table","Individual",4,30,"Yes","None","Strategy","",['assets/images/games/ninemensmorris_001.jpg']),
    Game(151,"Monopoly (Card game)",2,4,8,"Table","Individual",4,30,"Yes","None","Strategy","",['assets/images/games/monopolycard_001.jpg']),
    Game(152,"Monopoly (Dice game)",2,6,8,"Table","Individual",4,30,"Yes","None","Strategy","",['assets/images/games/monopolydice_001.jpg','assets/images/games/monopolydice_002.jpg']),
    Game(153,"Monopoly (Travel)",2,6,8,"Table","Individual",4,60,"Yes","None","Strategy","",['assets/images/games/monopolytravel_001.jpg']),
    Game(154,"Backgammon (Travel)",2,2,8,"Table","Individual",4,15,"Yes","None","Strategy","",['assets/images/games/backgammontravel_001.jpg']),
    Game(155,"Yahtzee (Travel)",2,6,8,"Table","Individual",4,15,"Yes","None","Dice strategy","",['assets/images/games/yahtzeetravel_001.jpg']),*/
  ];

  GamesCatalogModel(){


    print("***********************************");
    print("Hello, I am a new GamesCatalogModel");
    namesList.clear();
    gamesList.forEach((element) {
      namesList.add(element.name);
      print(namesList.length);
    });
    gamesList.sort((a, b) => a.name.compareTo(b.name));
    print("I am " + gamesList.length.toString() + " big");

  }

  Game getById(String id) => gamesList.firstWhere((game) => game.id == id);
  static Game getByName(String n) => gamesList.firstWhere((game) => game.name == n);
  Game getByIndex(int index) => gamesList[index];

  int getLength() => gamesList.length;

  static List<dynamic> getNames() {
    var returnList = [];
    gamesList.forEach((element) { returnList.add(element.name);});
    return returnList;
  }

  addGameToCatalogue(Game game){
    gamesList.add(game);
    notifyListeners();
  }


  sortAlphabetically(){

  }
}





