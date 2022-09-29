# BestNews

L'application "Best News" est une application permettant d'afficher une liste de News française et d'afficher le detail de celle-ci en cliquant sur la news souhaitée. L'application est sur une architecture MVVM et testée.

Le code de l'application a été realisé de façon professionnel dans le sens où le design pattern a été respecté, convention de code introduites, des génériques utilisés pour éviter de devoir se répeter, évidemment l'application n'a casiment pas de feature ce qui simplifie la tâche.

Il y a encore beaucoup de choses à ameliorer dans l'application tant UI que UX, comme par exemple le choix du pays des News, icones de l'application, une page de detail plus travaillée bien que ce n'est pas forcement l'objectif et c'est également chronophage.
    Pour encore mieux respecter les bonnes pratique on aurait pu évidemment ajouter SwiftLint.
    
Côté code, ce qui pourrait être améliorer serait à mon sens une gestion des erreurs générique, mieux gérer les données retour de l'appelle réseau (exemple: parfois on reçoit une chaine de string vide au lieu d'un "null").

On peut noter également que j'ai fait le choix d'utiliser des observeurs de données à la place de simple handler pour la communication entre le VC et le View Model.

La réalisation de cette application ne prends pas 2 ou 3 heures dans le sens où il faut monter toute une architecture, tester le code donc injection de dépendance, mettre en place les appels, utilisés des extensions ou package (ici KingFisher pour le chargement plus rapide des images), tout ça en essayant de produire quelque chose de relativement propre selon l'expérience du développeur qui va review le code source.

C'est pourquoi je vous remercie d'avoir pris le temps de review mon code en espérant avoir montrer ce dont je suis capable et avoir satisfait vos attentes, je suis également ouvert aux retours :).
