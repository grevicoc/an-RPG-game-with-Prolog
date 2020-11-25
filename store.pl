store :-    positionPlayer(_,BarisPlayer,KolomPlayer), position(store,BarisPlayer,KolomPlayer),
            write('WELCOME TO THE STORE!'),nl,nl,
            write('1. I want to buy!'),nl,
            write('2. I want to sell!'),nl,
            write('3. Just visiting!'),nl,nl,
            write('what do you want to do? '),read_integer(Pickshop),nl,
            (Pickshop = 1 -> buyitem,!;
            Pickshop = 2 -> sellitem,!;
            Pickshop = 3 -> write('Till next time fighter!'),nl,!).

store :-    positionPlayer(_,BarisPlayer,KolomPlayer), \+position(store,BarisPlayer,KolomPlayer),
            write('Oops, kamu tidak berada di store. Masuk ke dalam tempat berlambang \'S\' untuk akses fitur store!'),!.

cekbalance :- gold(_,Balance), write(Balance).

buyitem :-      write('---Here what i sell today---'),nl,
                write('1. Health Potion      |   25'),nl,
                write('2. Big Health Potion  |   50'),nl,
                write('3. Attack Potion      |   25'),nl,
                write('4. Defense Potion     |   25'),nl,
                write('5. Gacha              |   100'),nl,nl,
                gold(_,Balance), 
                write('Your Balance right now :'),
                write(Balance),nl,nl,

                write('Tell me what u want fighter: '), read_integer(Pickbuy),nl,
                
                (Pickbuy = 1 ->
                (Balance >= 25 -> 
                retract(gold(User,Balance)),
                New is Balance - 25,
                asserta(gold(User,New)),
                keepitem(health_potion),
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!);
                
                Pickbuy = 2 ->
                (Balance >= 50 -> 
                retract(gold(User,Balance)),
                New is Balance - 50,
                asserta(gold(User,New)),
                keepitem(big_health_potion),
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!);
                
                Pickbuy = 3 ->
                (Balance >= 25 -> 
                retract(gold(User,Balance)),
                New is Balance - 25,
                asserta(gold(User,New)),
                keepitem(attack_potion),
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!);

                Pickbuy = 4 ->
                (Balance >= 25 -> 
                retract(gold(User,Balance)),
                New is Balance - 25,
                asserta(gold(User,New)),
                keepitem(defense_potion),
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!);

                Pickbuy = 5 ->
                (Balance>=100 -> 
                retract(gold(User,Balance)),
                New is Balance - 100,
                asserta(gold(User,New)),
                gacha,nl,nl,
                write('Thankyou For Shopping!'),nl,!;
                write('Your Gold is not enough! Sell some item!'),!)).

sellitem :- write('Your bag contains : '), nl, nl,
            forall((cekBag(Item)), 
            (banyakitem(Item, Count), 
            write(Item), 
            write(' : '), 
            write(Count), nl)), nl,
            write('What do you want to sell? '), read(Sell),nl,
            
            (cekBag(Sell) -> 
            (hargaitem20(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 20,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('20 gold has already been added!'),!);

            hargaitem40(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 40,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('40 gold has already been added!'),!);

            hargaitem25(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 25,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('25 gold has already been added!'),!);

            hargaitem50(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 50,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('50 gold has already been added!'),!);

            hargaitem100(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 100,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('100 gold has already been added!'),!);

            hargaitem200(Sell) -> 
            (retract(gold(User,Balance)),
            New is Balance + 200,
            asserta(gold(User,New)),
            deleteItem(Sell),
            write('200 gold has already been added!'),!));

            write('You don\'t even have that item!'),nl,!).

gacha :- write('Masih belum juga pak').