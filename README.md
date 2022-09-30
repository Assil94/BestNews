# BestNews

L'application "Best News" est une application permettant d'afficher une liste de News françaises et d'afficher le détail de celle-ci en cliquant sur la news souhaitée. L'application est sur une architecture MVVM et testée.

Le code de l'application a été réalisé de façon professionnelle dans le sens où le design pattern a été respecté, convention de code introduites, des génériques utilisés pour éviter de devoir se répéter. Il faut noter que l'application n'a quasiment pas de feature ce qui simplifie la tâche.

Il y a encore beaucoup de choses à améliorer dans l'application, tant UI que UX, comme par exemple: le choix du pays des News, icônes de l'application, ajouter une page de détail plus travaillée, bien que ce ne fut pas forcément l'objectif et que cela rajouterait du temps.
 Pour encore mieux respecter les bonnes pratiques on aurait pu évidemment ajouter SwiftLint.
    
Côté code, ce qui pourrait être amélioré serait à mon sens une gestion des erreurs générique, mieux gérer les données retour de l'appel réseau (exemple: parfois on reçoit une chaine de string vide au lieu d'un "null").

On peut noter également que j'ai fait le choix d'utiliser des observeurs de données à la place de simple handler pour la communication entre le VC et le View Model.

La réalisation de cette application ne prends pas 2 ou 3 heures. En effet, il s’agit en réalité de monter toute une architecture, tester le code donc injection de dépendance, mettre en place les appels, utiliser des extensions ou package (ici KingFisher pour le chargement plus rapide des images), tout cela en essayant de produire quelque chose de propre selon l'expérience du développeur qui va review le code source.

C'est pourquoi je vous remercie d'avoir pris le temps de review mon code en espérant avoir montré ce dont je suis capable et avoir satisfait vos attentes, je suis également ouvert aux retours :).
