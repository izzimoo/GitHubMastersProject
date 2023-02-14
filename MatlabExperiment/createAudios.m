% Raw audio flies converted to a full audio with uniform silences in
% between each file in the final audio

% Raw audio flies converted to a full audio with uniform silences in
% between each file in the final audio

% % CarBus raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_engine.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_steer.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_drive.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_seat.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_wheels.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_commute.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_passenger.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_driver.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_fuel.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_motorway.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_intercity.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_opentop.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_windscreen.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_manual.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarBus/carbus_automatic.wav');

% HouseApartment raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_kitchen.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_bedroom.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_bathroom.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_doors.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_hall.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_floor.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_neighbourhood.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_rent.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_storey.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_landlord.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_neighbour.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_carpark.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/HouseApartment/houseapartment_roof.wav');

% % AppleOrange raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_juice.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_skin.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_fructose.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_pip.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_seeds.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_flavour.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_tree.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_sweet.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_sour.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_candy.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_stalk.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_bitter.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_round.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_organic.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_pulp.wav');
% [f15] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/AppleOrange/appleorange_nutritious.wav');

% BedCouch raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_sleep.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_comfortable.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_nap.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_laydown.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_snooze.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_pajamas.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_support.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_lounge.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_cushion.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_television.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_futon.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_sit.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_snuggle.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_doze.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_reclined.wav');
% [f15] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BedCouch/bedcouch_pillow.wav');

% CowPig raw audios
% [f0, fs] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_farm.wav');
% [f1] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_smell.wav');
% [f2] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_meat.wav');
% [f3] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_livestock.wav');
% [f4] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_tail.wav');
% [f5] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_vetinary.wav');
% [f6] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_breed.wav');
% [f7] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_trotters.wav');
% [f8] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_heavy.wav');
% [f9] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_barn.wav');
% [f10] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_flies.wav');
% [f11] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_mud.wav');
% [f12] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_manure.wav');
% [f13] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_produce.wav');
% [f14] = audioread('./RawRecordingFiles/WAV/CowPig/cowpig_barnyard.wav');

% FootballRugby raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_match.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_ball.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_defence.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_stadium.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_club.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_coach.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_league.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_wing.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_cup.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_tackle.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_positions.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_dropkick.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_nations.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_tournament.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/FootballRugby/footballrugby_offside.wav');

% % GoldSilver raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_ring.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_necklace.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_plated.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_medal.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_ingot.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_minted.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_mine.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_precious.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_enameled.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_antique.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_element.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_expensive.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_coin.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_trophy.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_shiny.wav');
% [f15] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/GoldSilver/goldsilver_gilded.wav');

% ChickenPork raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_farm.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_animal.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_pulled.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_escalope.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_taco.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_minced.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_marinated.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_barbeque.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_chargrilled.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_sausage.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_roast.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_fillet.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_cutlet.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_fried.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_braised.wav');
% [f15] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_crown.wav');
% [f16] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/ChickenPork/chickenpork_dumpling.wav');

% MovieBook raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_story.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_biographical.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_characters.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_sequel.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_narrator.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_writer.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_long.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_genre.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_review.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_fiction.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_plot.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_trilogy.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_cliffhanger.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_adaptation.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_fantasy.wav');
% [f15] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_award.wav');
% [f16] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/MovieBook/moviebook_collection.wav');

% % WaterMilk raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_thirst.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_thin.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_nonfat.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_minerals.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_bake.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_odourless.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_bottle.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_coconut.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_coffee.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_tea.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_nutrient.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_nourish.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_pour.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_hydrate.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/WaterMilk/watermilk_cereal.wav');

% BeeWasp raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_fly.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_wing.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_black.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_yellow.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_pest.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_queen.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_buzz.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_flower.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_sting.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_hive.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_pollinate.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_larva.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_swarm.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BeeWasp/beewasp_allergy.wav');

% TshirtShirt raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_button.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_sleeve.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_collar.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_armholes.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_pajamas.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_outfit.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_pullover.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_cotton.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_uniform.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_undergarment.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_comfortable.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_vneck.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_plain.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_logo.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TshirtShirt/tshirtshirt_polyester.wav');

% FlowerGrass raw audios
% [f0, fs] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_garden.wav');
% [f1] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_grow.wav');
% [f2] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_weed.wav');
% [f3] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_sprout.wav');
% [f4] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_stem.wav');
% [f5] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_ground.wav');
% [f6] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_roots.wav');
% [f7] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_die.wav');
% [f8] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_meadow.wav');
% [f9] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_aphid.wav');
% [f10] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_seeds.wav');
% [f11] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_pollen.wav');
% [f12] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_dirt.wav');
% [f13] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_water.wav');
% [f14] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_foliage.wav');
% [f15] = audioread('./RawRecordingFiles/WAV/FlowerGrass/flowergrass_spring.wav');

% BusTrain raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_intercity.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_coach.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_countrylink.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_commute.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_wheels.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_driver.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_seat.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_passenger.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_ticket.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_doubledecker.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_singledecker.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_route.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_transit.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_fare.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_station.wav');
% [f15] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_stop.wav');
% [f16] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_terminus.wav');
% [f17] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/BusTrain/bustrain_schedule.wav');

% CatDog raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_fur.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_paw.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_cute.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_cosy.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_microchipped.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_neutered.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_pet.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_breed.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_stray.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_whiskers.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_train.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_wild.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_cuddle.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_feed.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CatDog/catdog_tail.wav');

% UniversitySchool raw audios
[f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_faculty.wav');
[f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_junior.wav');
[f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_senior.wav');
[f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_pupil.wav');
[f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_graduate.wav');
[f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_subject.wav');
[f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_exam.wav');
[f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_teacher.wav');
[f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_mixed.wav');
[f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_societies.wav');
[f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_study.wav');
[f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_tuition.wav');
[f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_extracurriculars.wav');
[f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_curriculum.wav');
[f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/UniversitySchool/universityschool_scholarship.wav');
disp(length(f6)./fs)

% CarrotPotato raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_salad.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_ground.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_dirt.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_roots.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_fibre.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_roast.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_soup.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_peel.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_chop.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_nutritional.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_crop.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_mash.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_sweet.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_boil.wav');
% [f14] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/CarrotPotato/carrotpotato_firm.wav');

% % RainSnow raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_wet.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_fall.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_storm.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_sleet.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_fog.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_cloud.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_cold.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_winter.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_precipitation.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_water.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_slip.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_moisture.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/RainSnow/rainsnow_overcast.wav');

% % CowSheep raw audios
% [f0, fs] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_farm.wav');
% [f1] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_smell.wav');
% [f2] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_livestock.wav');
% [f3] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_vetinary.wav');
% [f4] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_breed.wav');
% [f5] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_field.wav');
% [f6] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_flies.wav');
% [f7] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_hooves.wav');
% [f8] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_manure.wav');
% [f9] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_barnyard.wav');
% [f10] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_milk.wav');
% [f11] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_produce.wav');
% [f12] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_herbivore.wav');
% [f13] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_meat.wav');
% [f14] = audioread('./RawRecordingFiles/WAV/CowSheep/cowsheep_tail.wav');

% % TeleivisionSmartphone raw audios
% [f0, fs] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_screen.wav');
% [f1] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_stream.wav');
% [f2] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_bluetooth.wav');
% [f3] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_cast.wav');
% [f4] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_media.wav');
% [f5] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_news.wav');
% [f6] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_wifi.wav');
% [f7] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_entertainment.wav');
% [f8] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_sound.wav');
% [f9] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_picture.wav');
% [f10] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_wireless.wav');
% [f11] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_signal.wav');
% [f12] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_brand.wav');
% [f13] = audioread('./EEGExperimentData/RawRecordingFiles/WAV/TelevisionSmartphone/televisionsmartphone_apps.wav');

% Create audios and add the random number values to an array so that the
% exact length of the silences and audio length can be determined later

% Audios for sequences with meaning 1
% Audio 1
randNo = randNumber();


combined1 = [zeros(round(fs*0.5),size(f1,2));f0;zeros(round(fs*randNo(1)),size(f1,2));
f14;zeros(round(fs*randNo(2)),size(f1,2));f2;zeros(round(fs*randNo(3)),size(f1,2));
f12;zeros(round(fs*randNo(4)),size(f1,2));f5;zeros(round(fs*randNo(5)),size(f1,2));
f10;zeros(round(fs*randNo(6)),size(f1,2));f9;zeros(round(fs*randNo(7)),size(f1,2));
f4;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f0)./fs, length(f14)./fs, length(f2)./fs, length(f12)./fs, length(f5)./fs, length(f10)./fs, length(f9)./fs, length(f4)./fs];


A1 = table(audioLen);
T1 = table(randNo);


% Audio 2
randNo = randNumber();


combined2 = [zeros(round(fs*0.5),size(f1,2));f0;zeros(round(fs*randNo(1)),size(f1,2));
f2;zeros(round(fs*randNo(2)),size(f1,2));f4;zeros(round(fs*randNo(3)),size(f1,2));
f10;zeros(round(fs*randNo(4)),size(f1,2));f5;zeros(round(fs*randNo(5)),size(f1,2));
f9;zeros(round(fs*randNo(6)),size(f1,2));f12;zeros(round(fs*randNo(7)),size(f1,2));
f14;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f0)./fs, length(f2)./fs, length(f4)./fs, length(f10)./fs, length(f5)./fs, length(f9)./fs, length(f12)./fs, length(f14)./fs];


A2 = table(audioLen);
T2 = table(randNo);


% Audio 3
randNo = randNumber();


combined3 = [zeros(round(fs*0.5),size(f1,2));f12;zeros(round(fs*randNo(1)),size(f1,2));
f14;zeros(round(fs*randNo(2)),size(f1,2));f10;zeros(round(fs*randNo(3)),size(f1,2));
f9;zeros(round(fs*randNo(4)),size(f1,2));f4;zeros(round(fs*randNo(5)),size(f1,2));
f5;zeros(round(fs*randNo(6)),size(f1,2));f0;zeros(round(fs*randNo(7)),size(f1,2));
f2;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f12)./fs, length(f14)./fs, length(f10)./fs, length(f9)./fs, length(f4)./fs, length(f5)./fs, length(f0)./fs, length(f2)./fs];


A3 = table(audioLen);
T3 = table(randNo);


% Audio 4
randNo = randNumber();


combined4 = [zeros(round(fs*0.5),size(f1,2));f9;zeros(round(fs*randNo(1)),size(f1,2));
f5;zeros(round(fs*randNo(2)),size(f1,2));f10;zeros(round(fs*randNo(3)),size(f1,2));
f2;zeros(round(fs*randNo(4)),size(f1,2));f0;zeros(round(fs*randNo(5)),size(f1,2));
f14;zeros(round(fs*randNo(6)),size(f1,2));f4;zeros(round(fs*randNo(7)),size(f1,2));
f12;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f9)./fs, length(f5)./fs, length(f10)./fs, length(f2)./fs, length(f0)./fs, length(f14)./fs, length(f4)./fs, length(f12)./fs];



A4 = table(audioLen);
T4 = table(randNo);


% Audio 5
randNo = randNumber();


combined5 = [zeros(round(fs*0.5),size(f1,2));f4;zeros(round(fs*randNo(1)),size(f1,2));
f5;zeros(round(fs*randNo(2)),size(f1,2));f10;zeros(round(fs*randNo(3)),size(f1,2));
f2;zeros(round(fs*randNo(4)),size(f1,2));f9;zeros(round(fs*randNo(5)),size(f1,2));
f12;zeros(round(fs*randNo(6)),size(f1,2));f14;zeros(round(fs*randNo(7)),size(f1,2));
f0;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f4)./fs, length(f5)./fs, length(f10)./fs, length(f2)./fs, length(f9)./fs, length(f12)./fs, length(f14)./fs, length(f0)./fs];



A5 = table(audioLen);
T5 = table(randNo);


% Audio 6
randNo = randNumber();


combined6 = [zeros(round(fs*0.5),size(f1,2));f12;zeros(round(fs*randNo(1)),size(f1,2));
f10;zeros(round(fs*randNo(2)),size(f1,2));f0;zeros(round(fs*randNo(3)),size(f1,2));
f5;zeros(round(fs*randNo(4)),size(f1,2));f14;zeros(round(fs*randNo(5)),size(f1,2));
f2;zeros(round(fs*randNo(6)),size(f1,2));f9;zeros(round(fs*randNo(7)),size(f1,2));
f4;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f12)./fs, length(f10)./fs, length(f0)./fs, length(f5)./fs, length(f14)./fs, length(f2)./fs, length(f9)./fs, length(f4)./fs];



A6 = table(audioLen);
T6 = table(randNo);


% Audio 7
randNo = randNumber();


combined7 = [zeros(round(fs*0.5),size(f1,2));f4;zeros(round(fs*randNo(1)),size(f1,2));
f12;zeros(round(fs*randNo(2)),size(f1,2));f5;zeros(round(fs*randNo(3)),size(f1,2));
f0;zeros(round(fs*randNo(4)),size(f1,2));f10;zeros(round(fs*randNo(5)),size(f1,2));
f14;zeros(round(fs*randNo(6)),size(f1,2));f2;zeros(round(fs*randNo(7)),size(f1,2));
f9;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f4)./fs, length(f12)./fs, length(f5)./fs, length(f0)./fs, length(f10)./fs, length(f14)./fs, length(f2)./fs, length(f9)./fs];



A7 = table(audioLen);
T7 = table(randNo);


% Audio 8
randNo = randNumber();


combined8 = [zeros(round(fs*0.5),size(f1,2));f10;zeros(round(fs*randNo(1)),size(f1,2));
f5;zeros(round(fs*randNo(2)),size(f1,2));f12;zeros(round(fs*randNo(3)),size(f1,2));
f9;zeros(round(fs*randNo(4)),size(f1,2));f4;zeros(round(fs*randNo(5)),size(f1,2));
f0;zeros(round(fs*randNo(6)),size(f1,2));f14;zeros(round(fs*randNo(7)),size(f1,2));
f2;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f10)./fs, length(f5)./fs, length(f12)./fs, length(f9)./fs, length(f4)./fs, length(f14)./fs, length(f14)./fs, length(f2)./fs];



A8 = table(audioLen);
T8 = table(randNo);


% Audios for sequences with meaning 2
% Audio 9
randNo = randNumber();


combined9 = [zeros(round(fs*0.5),size(f1,2));f12;zeros(round(fs*randNo(1)),size(f1,2));
f7;zeros(round(fs*randNo(2)),size(f1,2));f13;zeros(round(fs*randNo(3)),size(f1,2));
f8;zeros(round(fs*randNo(4)),size(f1,2));f3;zeros(round(fs*randNo(5)),size(f1,2));
f11;zeros(round(fs*randNo(6)),size(f1,2));f1;zeros(round(fs*randNo(7)),size(f1,2));
f6;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f12)./fs, length(f7)./fs, length(f13)./fs, length(f8)./fs, length(f3)./fs, length(f11)./fs, length(f1)./fs, length(f6)./fs];


A9 = table(audioLen);
T9 = table(randNo);


% Audio 10
randNo = randNumber();


combined10 = [zeros(round(fs*0.5),size(f1,2));f11;zeros(round(fs*randNo(1)),size(f1,2));
f12;zeros(round(fs*randNo(2)),size(f1,2));f7;zeros(round(fs*randNo(3)),size(f1,2));
f6;zeros(round(fs*randNo(4)),size(f1,2));f8;zeros(round(fs*randNo(5)),size(f1,2));
f2;zeros(round(fs*randNo(6)),size(f1,2));f1;zeros(round(fs*randNo(7)),size(f1,2));
f13;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f11)./fs, length(f12)./fs, length(f7)./fs, length(f6)./fs, length(f8)./fs, length(f2)./fs, length(f1)./fs, length(f13)./fs];


A10 = table(audioLen);
T10 = table(randNo);


% Audio 11
randNo = randNumber();


combined11 = [zeros(round(fs*0.5),size(f1,2));f11;zeros(round(fs*randNo(1)),size(f1,2));
f13;zeros(round(fs*randNo(2)),size(f1,2));f7;zeros(round(fs*randNo(3)),size(f1,2));
f8;zeros(round(fs*randNo(4)),size(f1,2));f1;zeros(round(fs*randNo(5)),size(f1,2));
f3;zeros(round(fs*randNo(6)),size(f1,2));f6;zeros(round(fs*randNo(7)),size(f1,2));
f12;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f11)./fs, length(f13)./fs, length(f7)./fs, length(f8)./fs, length(f1)./fs, length(f3)./fs, length(f6)./fs, length(f12)./fs];


A11 = table(audioLen);
T11 = table(randNo);


% Audio 12
randNo = randNumber();


combined12 = [zeros(round(fs*0.5),size(f1,2));f13;zeros(round(fs*randNo(1)),size(f1,2));
f8;zeros(round(fs*randNo(2)),size(f1,2));f12;zeros(round(fs*randNo(3)),size(f1,2));
f11;zeros(round(fs*randNo(4)),size(f1,2));f3;zeros(round(fs*randNo(5)),size(f1,2));
f2;zeros(round(fs*randNo(6)),size(f1,2));f6;zeros(round(fs*randNo(7)),size(f1,2));
f1;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f13)./fs, length(f8)./fs, length(f12)./fs, length(f11)./fs, length(f3)./fs, length(f2)./fs, length(f6)./fs, length(f1)./fs];


A12 = table(audioLen);
T12 = table(randNo);


% Audio 13
randNo = randNumber();


combined13 = [zeros(round(fs*0.5),size(f1,2));f13;zeros(round(fs*randNo(1)),size(f1,2));
f3;zeros(round(fs*randNo(2)),size(f1,2));f6;zeros(round(fs*randNo(3)),size(f1,2));
f2;zeros(round(fs*randNo(4)),size(f1,2));f11;zeros(round(fs*randNo(5)),size(f1,2));
f1;zeros(round(fs*randNo(6)),size(f1,2));f12;zeros(round(fs*randNo(7)),size(f1,2));
f8;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f13)./fs, length(f3)./fs, length(f6)./fs, length(f2)./fs, length(f11)./fs, length(f1)./fs, length(f12)./fs, length(f8)./fs];


A13 = table(audioLen);
T13 = table(randNo);


% Audio 14
randNo = randNumber();


combined14 = [zeros(round(fs*0.5),size(f1,2));f13;zeros(round(fs*randNo(1)),size(f1,2));
f12;zeros(round(fs*randNo(2)),size(f1,2));f8;zeros(round(fs*randNo(3)),size(f1,2));
f3;zeros(round(fs*randNo(4)),size(f1,2));f11;zeros(round(fs*randNo(5)),size(f1,2));
f2;zeros(round(fs*randNo(6)),size(f1,2));f6;zeros(round(fs*randNo(7)),size(f1,2));
f1;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f13)./fs, length(f12)./fs, length(f8)./fs, length(f3)./fs, length(f11)./fs, length(f2)./fs, length(f6)./fs, length(f1)./fs];


A14 = table(audioLen);
T14 = table(randNo);


% Audio 15
randNo = randNumber();


combined15 = [zeros(round(fs*0.5),size(f1,2));f2;zeros(round(fs*randNo(1)),size(f1,2));
f1;zeros(round(fs*randNo(2)),size(f1,2));f6;zeros(round(fs*randNo(3)),size(f1,2));
f12;zeros(round(fs*randNo(4)),size(f1,2));f13;zeros(round(fs*randNo(5)),size(f1,2));
f8;zeros(round(fs*randNo(6)),size(f1,2));f3;zeros(round(fs*randNo(7)),size(f1,2));
f11;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f2)./fs, length(f1)./fs, length(f6)./fs, length(f12)./fs, length(f13)./fs, length(f8)./fs, length(f3)./fs, length(f11)./fs];


A15 = table(audioLen);
T15 = table(randNo);


% Audio 16
randNo = randNumber();


combined16 = [zeros(round(fs*0.5),size(f1,2));f8;zeros(round(fs*randNo(1)),size(f1,2));
f7;zeros(round(fs*randNo(2)),size(f1,2));f6;zeros(round(fs*randNo(3)),size(f1,2));
f13;zeros(round(fs*randNo(4)),size(f1,2));f11;zeros(round(fs*randNo(5)),size(f1,2));
f1;zeros(round(fs*randNo(6)),size(f1,2));f3;zeros(round(fs*randNo(7)),size(f1,2));
f12;zeros(round(fs*randNo(8)),size(f1,2))];


audioLen = [length(f8)./fs, length(f7)./fs, length(f6)./fs, length(f13)./fs, length(f11)./fs, length(f1)./fs, length(f3)./fs, length(f12)./fs];


A16 = table(audioLen);
T16 = table(randNo);

% Write the random numbers to a final table 

T = [T1;T2;T3;T4;T5;T6;T7;T8;T9;T10;T11;T12;T13;T14;T15;T16];
writetable(T, './EEGExperimentData/SequenceAudioSilenceLengths/Silences/UniversitySchool_SilenceLength.txt');

A = [A1;A2;A3;A4;A5;A6;A7;A8;A9;A10;A11;A12;A13;A14;A15;A16];
writetable(A, './EEGExperimentData/SequenceAudioSilenceLengths/Audios/UniversitySchool_AudioLength.txt');

audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M1_1.wav',combined1, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M1_2.wav',combined2, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M1_3.wav',combined3, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M1_4.wav',combined4, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M1_5.wav',combined5, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M1_6.wav',combined6, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M1_7.wav',combined7, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M1_8.wav',combined8, fs)

audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M2_9.wav',combined9, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M2_10.wav',combined10, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M2_11.wav',combined11, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M2_12.wav',combined12, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M2_13.wav',combined13, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M2_14.wav',combined14, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M2_15.wav',combined15, fs)
audiowrite('./EEGExperimentData/CompletedRecordingsEEG/UniversitySchool/US_M2_16.wav',combined16, fs)






