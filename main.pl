:- include('character.pl').
:- include('inventory.pl').
:- include('items.pl').
:- include('map.pl').
:- include('store.pl').
:- include('savefile.pl').
:- include('loadfile.pl').
:- include('battlemech.pl').
:- include('enemy.pl').
:- include('goalstate.pl').

menu :-     write('                                WELCOME FIGHTER!'),nl,nl,
            write('                    _             _,-----------._        '),nl,
            write('                              _,-_,-----------._`-._    '),nl,
            write('                             ,_,-  ___________  `-._.'),nl,
            write('                          ''   ,     ___________ -._  ..'),nl,
            write('                        ,,    ,,                `-.`.  `.`.'),nl,
            write('                       /,   ,,        >|<           ..   \\\\'),nl,
            write('                      //  ,,      ><  .^.  ><        ..    \\\\'),nl,
            write('                     // //        ><   / | \\   ><      \\\\   \\\\'),nl,
            write('                    //  //      ><    \\/\\^/\\/    ><     \\\\  \\\\'),nl,
            write('                   ;;  ;;              `---              ::  ::'),nl,
            write('                   ||  ||              (____              ||  ||'),nl,
            write('                  _||__||_            .-----.            _||__||_'),nl,
            write('                 (o.____.o)____         ---        ____(o.____.o)'),nl,
            write('                   |    | /,--.)                   (,--.\\ |    |'),nl,
            write('                   |    |((  -`___               ___`   ))|    |'),nl,
            write('                   |    | \\,'',  `.             .  .``.//  |    |'),nl,
            write('                   |    |  // (___, .          . .___) \\  |    |'),nl,
            write('                  /|    | ;;))  ____) .      . (____  ((\\ |    |\\'),nl,
            write('                  \\|.__ | ||/ ..--.\\/        `/,--.`. \\;: | __,|;'),nl,
            write('                   |`-,`;.| :/ /,  `)-        `-(  `.\\ \\: |.;,-|'),nl,
            write('                   |   `..    / \\__.          `.__/ \\   ,.|    |'),nl,
            write('                   |    |,\\  /,                     ,\\  /,|    |'),nl,
            write('                   |    ||: : )          .          ( : :||    |'),nl,
            write('                  /|    ||: |/  .      ./|\\.      .  \\| :;|    |\\'),nl,
            write('                  \\|.__ |/  :  ,/-    <--:-->    ,\\.  ;  \\| __,|;'),nl,
            write('                   |`-.``:   /-.     \\|//     ,-\\`;   ;,- |    |'),nl,
            write('                   |    ||               .               ||    |'),nl,
            write('                   |    ||  :                         :  ||    |'),nl,
            write('                   |    ||  |                         |  ||    |'),nl,
            write('                   |    ||  |                         |  ||    |'),nl,
            write('                   |    ||  |           _             |  ||    |'),nl,
            write('                   |    |   |         ((|))           |   |    |'),nl,
            write('                   ;____:    ._         .           _.   ;____:'),nl,
            write('                  {______}     \\___________________/     {______}'),nl,
            write('                  |______|_______________________________|______|'),nl,nl,nl,
            write('1. start new journey'),nl,
            write('2. continue the journey'),nl,
            write('2. Quit'),nl,nl,
            write('Choose what you want to do fighter! : '), read_integer(Pick),nl,

            (Pick = 1 -> 
            write('   ______________________________'),nl,
            write(' /  |                            |.'),nl,
            write('|   |           *****            |.'),nl,
            write('|_ _|                            |.'),nl,
            write('    |     Let\'s                  |.'),nl,
            write('    |                            |.'),nl,
            write('    |                            |.'),nl,
            write('    |             start          |.'),nl,
            write('    |                            |.'),nl,
            write('    |       the                  |.'),nl,
            write('    |                            |.'),nl,
            write('    |                            |.'),nl,
            write('    |              journey!      |.'),nl,
            write('    |                            |.'),nl,
            write('    |          *****             |.'),nl,
            write('    |   _________________________|___'),nl,
            write('    |  /                            /.'),nl,
            write('    |_/____________________________/.'),nl,nl, start, !;
            Pick = 2 -> 
            write('   ______________________________'),nl,
            write(' /  |                            |.'),nl,
            write('|   |           *****            |.'),nl,
            write('|_ _|                            |.'),nl,
            write('    |     Let\'s                  |.'),nl,
            write('    |                            |.'),nl,
            write('    |                            |.'),nl,
            write('    |             continue       |.'),nl,
            write('    |                            |.'),nl,
            write('    |       the                  |.'),nl,
            write('    |                            |.'),nl,
            write('    |                            |.'),nl,
            write('    |              journey!      |.'),nl,
            write('    |                            |.'),nl,
            write('    |          *****             |.'),nl,
            write('    |   _________________________|___'),nl,
            write('    |  /                            /.'),nl,
            write('    |_/____________________________/.'),nl,nl,load,!; 
            Pick = 2 -> 
            write('   ______________________________'),nl,
            write(' /  |                            |.'),nl,
            write('|   |           *****            |.'),nl,
            write('|_ _|                            |.'),nl,
            write('    |                            |.'),nl,
            write('    |          Till              |.'),nl,
            write('    |                            |.'),nl,
            write('    |            next            |.'),nl,
            write('    |                            |.'),nl,
            write('    |              time          |.'),nl,
            write('    |                            |.'),nl,
            write('    |               fighter!     |.'),nl,
            write('    |                            |.'),nl,
            write('    |                            |.'),nl,
            write('    |           *****            |.'),nl,
            write('    |   _________________________|___'),nl,
            write('    |  /                            /.'),nl,
            write('    |_/____________________________/.'),nl,
            nl, !).

:- dynamic(alreadystart/1).

start    :- alreadystart(_), write('You already start the journey!'), !,nl.

start    :- \+alreadystart(_), asserta(alreadystart(1)),

            write('Please tell me your name fighter : '), read(Username),nl,
            write('This is the class that you can choose: '),nl, 
            write('1. Swordsman'),nl,
            write('2. Archer'),nl,
            write('3. Sorcerer'),nl,nl,

            write('Choose wisely: '), read_integer(Pickclass), nl,

            (Pickclass = 1 -> createswordsman(Username),nl,
            write('You have become a Swordsman'),nl,
            write('     =='),nl,
            write('     ||_________________________'),nl,
            write('OOOOO||_________________________>'),nl,
            write('     ||'),nl,
            write('     =='),nl;        

            Pickclass = 2 -> createarcher(Username),
            write('You have become a Archer'),nl, 
            write('   _'),nl,
            write('.-` |___________________________///'),nl,
            write('`-._|                           \\\\\\'),nl;

            Pickclass = 3 -> createsorcerer(Username),
            write('You have become a Sorcerer'),nl,nl,
            
            write('             _'),nl,
            write('     _____   0    _____'),nl,
            write('    vVVVVV __|__ VVVVVv '),nl,
            write('   vVVVVVVvvv|vvvVVVVVVv'),nl,
            write('  vVVVV      |      VVVVv'),nl,
            write(' vVVV        |       VVVv'),nl,
            write(' vVV         |_)      VVv'),nl,
            write(' v          (|          v'),nl,
            write('             |)'),nl,
            write('            (|  '),nl,
            write('             |)'),nl,
            write('            (| '),nl,
            write('             |`'),nl,
            write('             |'),nl).

stats    :- positionPlayer(Username,_,_),
            checkstats(Username),!.

bag :-  write(' _                 '),nl,
        write('| |                '),nl,
        write('| |__   __ _  __ _ '),nl,
        write('|  _ \\ / _  |/ _  |'),nl,
        write('| |_) | (_| | (_| |'),nl,
        write('|_.__/ \\__,_|\\__, |'),nl,
        write('              __/ |'),nl,
        write('             |___/ '),nl,nl,
        write('Your bag contains : '), nl, nl,
        forall((cekBag(Item)), 
        (banyakitem(Item, Count), 
        write(Item), 
        write(' : '), 
        write(Count), nl)), nl.

help :-     alreadystart(_) ->
            write(' _          _       '),nl,
            write('| |        | |      '),nl,
            write('| |__   ___| |_ __  '),nl,
            write('|  _ \\ / _ \\ |  _ \\ '),nl,
            write('| | | |  __/ | |_) |'),nl,
            write('|_| |_|\\___|_| .__/ '),nl,
            write('             | |    '),nl,
            write('             |_|    '),nl,nl,
            write('These are the command you can use in your game : '),nl,nl,
            write('- write stats. to see your stats'),nl,
            write('- write bag. to check your inventory'),nl,
            write('- write helpequip. to check how to use item'),nl,
            write('- write helpebattle. to check how to battling in here'),nl,
            write('- write map. to check where you are'),nl,
            write('- write w./a./s./d. to move'),nl,
            write('- write teleport(<name_of_place>). to teleport you near zone, with a choices of zone is store, quest, ogre, viper, wolf, golem, miniboss, and boss'),nl,
            write('- write store. di zona store untuk mengakses fitur store'),nl,
            write('----nanti ditambahin lagi help nya----'),nl,!;
            write('Start the game first fighter!').

helpequip :-    write(' _          _       '),nl,
                write('| |        | |      '),nl,
                write('| |__   ___| |_ __  '),nl,
                write('|  _ \\ / _ \\ |  _ \\ '),nl,
                write('| | | |  __/ | |_) |'),nl,
                write('|_| |_|\\___|_| .__/ '),nl,
                write('             | |    '),nl,
                write('             |_|    '),nl,nl,
                write('                  _       '),nl,
                write('                 (_)      '),nl,
                write('  ___  __ _ _   _ _ _ __  '),nl,
                write(' / _ \\/ _  | | | | |  _ \\ '),nl,
                write('|  __/ (_| | |_| | | |_) |'),nl,
                write(' \\___|\\__, |\\__,_|_| .__/ '),nl,
                write('         | |       | |    '),nl,
                write('         |_|       |_|    '),nl,nl,
                write('---This is the command you can  use : '),nl,nl,
                write('- write useWeapon(<item_name>). to equip your weapon'),nl,
                write('- write useArmor(<item_name>). to equip your weapon'),nl,
                write('- write useAccessory(<item_name>). to equip your weapon'),nl,
                write('- write usePotion(<item_name>). to use your potion'),nl.

helpbattle :-   write('First, you need to walk around to find casual monster. Or you can'),nl
                write('just walk to Monster Zone with symbol of \'O\' \'W\' \'V\' \'G\'. Last'),nl
                write('you can fight miniboss or boss (if you brave enough) on the symbol of'),nl
                write('\'M\' or \'B\''),nl,nl
                write('---This is the command you can  use if you face monster : '),nl,nl,
                write('- write fight. to battling the monster'),nl,
                write('- write run. to try run from the monster (u cant run from boss and miniboss)'),nl,