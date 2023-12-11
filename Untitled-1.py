"""
-----------------------------------------------------------------------------
i11_Dufaut_Galazzo--Magnien_projet.py : CR projet « Tours de Hanoï », groupe K

Kévin Dufaut <kevin.dufaut@etu.univ-grenoble-alpes.fr>
Marco Galazzo--Magnien <marco.galazzo--magnien@etu.univ-grenoble-alpes.fr>
-----------------------------------------------------------------------------
"""
import turtle
from copy import deepcopy
import time

#==== Partie A
# Fonction demandée
def init(n):
    """
    Renvoie un nouveau plateau de n disques sous forme d'une liste avec la tour
    de gauche (indice 0) contenant les disques de 1 à n. Les autres tours
    (indices 1 et 2) sont initialisées comme des listes vides.

    >>> init(5)
    [[5, 4, 3, 2, 1], [], []]
    >>> init(0)
    [[], [], []]
    """
    lstSource = []
    # mise en place des disques de 1 à n
    for i in range(n,0,-1):
        lstSource.append(i)
    return [lstSource,[],[]]

# Fonction personelle
def verif_tour_existe(numtour):
    """
    Recoit un indice, est renvoie True si c'est un indice de tour qui existe
    appartient à {0,1,2}, False sinon
    
    >>> verif_tour_existe(1)
    True
    >>> verif_tour_existe(-1)
    False
    >>> verif_tour_existe(4)
    False
    """
    return numtour >= 0 and numtour <= 2

# Fonction demandée
def nbDisques(plateau, numtour):
    """
    Reçoit plateau, la configuration courante du plateau et numtour, un numéro
    de tour (entre 0 et 2), et qui renvoie le nombre de disques sur cette tour,
    si le numéro de la tour est incorrect, alors renvoie -1.

    >>> nbDisques([[5, 4, 3, 2, 1], [], []],0)
    5
    >>> nbDisques([[5, 4, 3, 2, 1], [], []],1)
    0
    >>> nbDisques([[5, 4, 3, 2, 1], [], []],4)
    -1
    """
    res = -1
    # si la tourexiste, renvoie la taille de la tour
    if verif_tour_existe(numtour): res = len(plateau[numtour]) 
    return res

# Fonction demandée
def disqueSup(plateau, numtour):
    """
    Reçoit la configuration courante plateau et un entier numtour, et renvoie le
    numéro du disque supérieur de cette tour (ou -1 si elle est vide ou
    incorrecte).

    >>> disqueSup([[5, 4, 3, 2, 1], [], []],0)
    1
    >>> disqueSup([[5, 4, 3, 2, 1], [], []],1)
    -1
    >>> disqueSup([[5, 4, 3, 2, 1], [], []],4)
    -1
    """
    val = -1
    nb = nbDisques(plateau, numtour) # nombre de disques dans la tour
    # si la tour existe et n'est pas vide, renvoie le numéro du disque supérieur
    # de cette tour
    if nb > 0:val = plateau[numtour][nb-1]
    return val

# Fonction demandée
def posDisque(plateau, numdisque):
    """
    Reçoit la configuration courante du plateau et un numéro de disque, et qui
    renvoie sa position, c'est-à-dire le numéro de la tour sur laquelle il est
    placé, renvoie -1 si le numéro de disque est incorrect.
    
    >>> posDisque([[5, 4, 3, 2, 1], [], []],1)
    0
    >>> posDisque([[5, 4, 3], [2, 1], []],1)
    1
    >>> posDisque([[5, 4, 3, 2, 1], [], []],6)
    -1
    """
    numtour = 0 # la position est définie sur 0 par défaut
    while numtour < 3 and not numdisque in plateau[numtour]:
        numtour += 1 # parcourt le plateau pour trouver le disque
    if numtour == 3: numtour = -1 # si le numéro de tour est incorrect
    return numtour

# fonction personelle
def hauteurDisque(plateau, numdisque):
    """
    Reçoit la configuration courante du plateau et un numéro de disque, et qui
    renvoie sa hauteur, c'est-à-dire l'indice sur la tour sur laquelle il est
    placé, renvoie -1 si le disque n'existe pas.

    >>> hauteurDisque([[5, 4, 3, 2, 1], [], []],1)
    4
    >>> hauteurDisque([[5, 4, 3], [2, 1], []],1)
    1
    >>> hauteurDisque([[5, 4, 3, 2, 1], [], []],6)
    -1
    """
    indexDisque = -1
    indexTour = posDisque(plateau,numdisque) # indice de la tour
    if indexTour != -1:
        nbd = nbDisques(plateau, indexTour) # nombre de disques sur la tour
        indexDisque = 0 # la hauteur est définie sur 0 par défaut
        while indexDisque < nbd and plateau[indexTour][indexDisque]!=numdisque:
            indexDisque += 1 # parcourt la tour pour trouver le disque
    return indexDisque

# Fonction demandée
def verifDepl(plateau, nt1, nt2):
    """
    Reçoit en argument une configuration du plateau, une position initiale et
    une position finale, et qui renvoie un booléen indiquant si ce déplacement
    est autorisé (c-à-d qu’il y a bien un disque dans la tour nt1, et que la
    tour nt2 est vide ou contient un disque plus grand que celui qu’on veut y
    poser).

    >>> verifDepl([[5, 4, 3], [2, 1], []], 1, 2)
    True
    >>> verifDepl([[5, 4, 3], [2, 1], []], 1, 0)
    True
    >>> verifDepl([[5, 4, 3], [2, 1], []], 0, 1)
    False
    """
    verification = False
    valeurdestination = disqueSup(plateau,nt2) # valeur de la tour supérieure
    if valeurdestination == -1: # si la tour est vide
        verification = True
    else : # si la tour nt2 n'est pas vide
        verification = disqueSup(plateau,nt1) < valeurdestination
    return verification

# Fonction demandée
def verifVictoire(plateau, n):
    """
    reçoit en argument la configuration du plateau et le nombre de disques, et
    qui vérifie si on a atteint la solution, c'est-à-dire les n disques empilés
    dans l’ordre décroissant de taille (de n à 1) sur la tour de droite, les
    autres tours étant vides.

    >>> verifVictoire([[5, 4, 3], [2, 1], []], 5)
    False
    >>> verifVictoire([[], [], [5, 4, 3, 2, 1]], 5)
    True
    """
    lstDestination = []
    # mise en place des disques de 1 à n
    for i in range(n,0,-1):
        lstDestination.append(i)
    return [[],[],lstDestination] == plateau

#==== Partie B

# Définition des constantes de dimension
EP_DSQ = 20 # taille Y d'un disque / du plateau
EP_TOUR = 6 # taille X d'une tour 
DM_D1 = 40 # taille X du disque le plus petit (de taille 1)
DIFF_DM = 30 # taille X de la différence entre un diques n et n+1
DEC_TOUR = 20 # taille X du décalage minimum entre 2 tours
COOR_PLAT = (-300, 0) # coordonnées coin gauche supérieur du plateau

# Fonction personelle
def init_turtle():
    """
    Initialisation d'une fenêtre turtle et d'un curseur, et renvoie le curseur
    """
    curseur = turtle.Turtle()
    curseur.speed(0.5)
    curseur.penup()
    return curseur

# Fonction personelle
def dessineRectangle(dimx, dimy,couleur="black", affichageSuperieur=True,
                     affichageInferieur=True):
    """
    Dessine en utilisant curseur un rectangle à la postion (dimx,dimy)
    """
    curseur.color(couleur)
    curseur.begin_fill()
    for i in range(2):
        # Dessiner les côtés horizontaux (supérieur et inférieur)
        if (i == 0 and affichageSuperieur) or (i == 1 and affichageInferieur):
            curseur.pendown()
        else:
            curseur.penup()
        curseur.forward(dimx)
        curseur.right(90)

        # Dessiner les côtés verticaux (gauche et droite)
        curseur.pendown()
        curseur.forward(dimy)
        curseur.right(90)
    curseur.end_fill()
    curseur.color("black")
    curseur.penup()

# fonction personnelle
def posDessinRect(dimxDuRectangle,dimxMax,indexTour,indexHauteur):
    """
    Renvoie la position supérieure gauche du rectangle à tracer au milieu de la
    tour indexTour à la hauteur indexHauteur
    """
    # décalage x
    dx = DEC_TOUR + (dimxMax-dimxDuRectangle)//2 + indexTour*(DEC_TOUR+dimxMax)
    # décalage y
    dy = (indexHauteur+1)*EP_DSQ
    
    x, y = COOR_PLAT
    return x+dx, y+dy # renvoie la position finale

# fonction personnelle
def dessineDisqueSurTour(nd,plateau,n,couleurDisque,couleurTour=None):
    """
    Dessine le disque nd de couleur couleurDisque (dessine par dessus la tour au
    niveau du disque nd si couleurTour est spécifié) 
    """
    p = posDisque(plateau, nd)
    h = hauteurDisque(plateau, nd)
    diametreDisque = DM_D1+DIFF_DM*(nd-1)

    # va à la position supérieure gauche du disque à dessiner
    curseur.goto(posDessinRect(diametreDisque,DM_D1+DIFF_DM*(n-1),p,h))
    # dessine le disque
    dessineRectangle(diametreDisque,EP_DSQ,couleurDisque,
                     affichageInferieur=False)
    
    if couleurTour: # Si besoin de dessiner la tour
        # va à la position supérieure gauche de la tour à dessiner
        curseur.goto(posDessinRect(EP_TOUR,DM_D1+DIFF_DM*(n-1),p,h))
        # dessine la tour
        dessineRectangle(EP_TOUR,EP_DSQ,couleurTour,affichageInferieur=False,
                         affichageSuperieur=False)

# Fonction demandée
def dessinePlateau(n):
    """
    dessine le plateau de jeu vide pouvant recevoir n disques
    """
    x, y = COOR_PLAT
    curseur.goto((x,y)) # Va au coin supérieur gauche du plateau

    dimxplateau = 3*(DM_D1+DIFF_DM*(n-1)) + 4*DEC_TOUR # dimension x du plateau
    dessineRectangle(dimxplateau,EP_DSQ) # dessine le plateau

    # dessine les trois tours
    for i in range(3):
        # va au coin supérieur gauche de la tour
        curseur.goto(posDessinRect(EP_TOUR,DM_D1+DIFF_DM*(n-1),i,n))
        dessineRectangle(EP_TOUR,(n+1)*EP_DSQ,affichageInferieur=False)

# Fonction demandée
def dessineDisque(nd, plateau, n):
    """
    Dessine le disque nd du plateau
    """
    # définition de la couleur du disque en fonction de son numéro
    couleur = ("green","lightgreen","turquoise","cyan","navy")[(n-nd)%5]
    dessineDisqueSurTour(nd,plateau,n,couleur) # dessine le disque

# Fonction demandée
def effaceDisque(nd, plateau, n):
    """
    Efface le disque nd du plateau
    """
    # efface (dessine en blanc) le disque puis rajoute par dessus la tour en
    # couleur noire
    dessineDisqueSurTour(nd,plateau,n,"white","black")

# Fonction demandée
def dessineConfig(plateau, n):
    """
    Dessine la configuration du plateau
    """
    # pour t la tour et pour h la hauteur du disque : dessiner tous les disques
    for t in plateau:
        for h in t:
            dessineDisque(h,plateau,n)

# Fonction demandée
def effaceTout(plateau, n):
    """
    Efface tous les disques du plateau
    """
    # pour t la tour et pour h la hauteur du disque : effacer tous les disques
    for t in plateau:
        for h in t:
            effaceDisque(h,plateau,n)

#==== Partie C

# Fonction personelle
def max_liste(liste):
    """
    Trouve et retourne le plus grand élément d'une liste. Si la liste est vide,
    renvoie None.

    >>> max_liste([1,5,8,7,11,9,3,4,5,6,8])
    11
    >>> max_liste([1])
    1
    """
    maximum = None
    if liste: # Vérifie si la liste n'est pas vide
        maximum = liste[0] # Initialise maximum au premier élément de la liste
        for element in liste:
            if element > maximum: # Si l'élément est plus grand que maximum
                maximum = element 
    return maximum  # Retourne le plus grand élément trouvé

# Fonction demandée
def lireCoords(plateau):
    """
    Demande les coordonnées départs/destination d'une tour, vérifie si elles
    sont correctes, puis les renvoie sous forme d'un couple 
    """
    # initialisation des tours à -1 considérées comme incorrectes dans un
    # premier temps
    nt1 = -1 # tour de départ
    nt2 = -1 # tour d'arrivée

    promt = "Numéro de la tour de départ : "
    res = input(promt)
    while nt1 == -1: # pendant que la tour de départ est incorrecte
        if res.isdigit(): # si l'indice de la tour est un nombre
            res = int(res)
            ds = disqueSup(plateau,res)
            if not ds == -1: # si la tour existe et n'est pas vide
                disqueSups = []
                for i in [0,1,2]:disqueSups.append(disqueSup(plateau,i))
                # disqueSups est la liste des valeurs des disques supérieurs des
                # 3 tours
                if not max_liste(disqueSups) == ds or -1 in disqueSups:
                    # la tour de départ est correcte : alors définir la tour de
                    # départ
                    nt1 = res
                else: # la tour ne peut pas être déplacée car trop grande
                    errmes = "Indice de tour "+str(res)+" incorrect : le disque\
 supérieur de la tour est trop grand, il ne peut pas être déplacé."
            else: # la tour n'existe pas ou est vide
                errmes = "Indice de tour "+str(res)+" incorrect : doit être un \
nombre entre 0 et 2 et ne doit pas être vide."
        else : # l'indice de la tour n'est un nombre
            errmes = "Indice de tour "+res+" incorrect : ce n'est pas un indice\
 de tour."
        if nt1 == -1:
            print("\n"+errmes)
            res = input(promt)

    promt = "Numéro de la tour de d'arrivée : "
    res = input(promt)
    while nt2 == -1: # pendant que la tour d'arrivée est incorrecte
        if res.isdigit(): # si l'indice de la tour est un nombre
            res = int(res)
            ds = disqueSup(plateau,res)
            if not verif_tour_existe(res):
                # si la tour n'existe pas ou le déplacement n'est pas possible
                errmes = "Indice de tour "+str(res)+" incorrect : doit être un \
nombre entre 0 et 2."
            elif res == nt1:
                # sinon si la tour d'arrivée est la même que celle du départ
                errmes = "Indice de tour "+str(res)+" incorrect : doit être dif\
férent de la tour de départ."
            elif not verifDepl(plateau,nt1,res):
                # sinon si le disque supérieur de la tour est trop petit par
                # rapport à celui de la tour de départ
                errmes = "Indice de tour "+str(res)+" incorrect : le disque sup\
érieur de la tour est trop petit par rapport à celui de la tour de départ."
            else: # sinon la tour d'arrivée est correcte : alors définir la tour
                  # d'arrivée
                nt2 = res
        else : # l'indice de la tour n'est un nombre
            errmes = "Indice de tour "+res+" incorrect : ce n'est pas un indice\
 de tour."
        
        if nt2 == -1: # si la valeur de la tour est toujours incorrecte
            print("\n"+errmes)
            res = input(promt)
    # les tours nt1 et nt2 sont correctes : les renvoyer
    return nt1,nt2

# Fonction demandée
def jouerUnCoup(plateau,n) :
    """
    Récupère le déplacement que le joueur souhaite faire ; puis qui déplace le
    disque.
    """
    coup = lireCoords(plateau)
    # efface le disque supérieur de la tour de départ sur le plateau initial
    effaceDisque(disqueSup(plateau,coup[0]),plateau,n)
    # reconfigure le plateau
    plateau[coup[1]].append(plateau[coup[0]].pop())
    # redessine le disque sur le plateau final
    dessineDisque(disqueSup(plateau,coup[1]),plateau,n)

# Fonction demandée
def boucleJeu(plateau,n):
    """
    Intéragit avec l’utilisateur pour déplacer des disques jusqu'à ce que
    celui-ci ait gagné.
    """
    print("Bienvenue dans les Tours de Hanoi")
    nb_coup = 0
    while not verifVictoire(plateau,n): # boucle jusqu'à que le joueur gagne
        # Joue un coup
        jouerUnCoup(plateau,n)
        nb_coup += 1
        coups[nb_coup] = deepcopy(plateau)
        
        # gestion de l'annulation du dernier coup
        res = "o" # valeur par défaut (aller au moins une fois dans la boucle)
        while res == "o" and nb_coup > 0:
            # boucle jusqu'à que le plateau reprend sa forme initiale ou que
            # l'utilisateur ne souhaite plus annuler de coup
            prompt = "Annuler le dernier coup ? (o/n) :"
            res = input(prompt)
            if res == "o": # si l'utilisateur souhaite annuler le dernier coup
                annulerDernierCoup(coups,n)
                nb_coup-=1
                plateau = coups[nb_coup]
    return nb_coup

#==== Partie D
# Fonction demandée
def dernierCoup(coups):
    """
    Renvoie le dernier coup joué, sous la forme d'une paire (tour de départ,
    tour d'arrivée) à partir du dictionnaire des plateaux coups
    """
    lst = []
    for elt in coups: # Parcourir tous les numéros de coups
        lst.append(elt)
    
    nb = max_liste(lst) # trouver le dernier mouvement
    plateau_act = coups[nb] # état actuel du plateau
    dernier_plateau = coups[nb-1] # état du plateau avant le dernier mouvement
    
    nt1 = -1 # numéro de la tour de départ
    nt2 = -1 # numéro de la tour d'arrivée
    i = 0
    while nt1 == -1 or nt2 == -1:
        # tant que les tours de départ et d'arrivée ne sont pas identifiées
        nbDisqAct = len(plateau_act[i])  # nb de disques sur la tour actuelle
        nbDisqDer = len(dernier_plateau[i])  # nb de disques sur la même tour
        # dans l'état précédent

        if nbDisqAct != nbDisqDer: # Si le nb de disques sur la tour a changé
            if nbDisqAct < nbDisqDer: # Si un disque a été enlevé de cette tour
                nt2 = i  # Cette tour est la tour d'arrivée
            else: # un disque a alors été ajouté à cette tour
                nt1 = i  # Cette tour est la tour de départ
        i += 1
    return nt1, nt2

# Fonction demandée
def annulerDernierCoup(coups,n):
    """
    qui recoit le dictionnaire des plateaux coups et qui annule le dernier coup
    """
    der = dernierCoup(coups) # dernier coup effectué
    nbmax = len(coups) - 1 # Obtenir l'indice du dernier coup

    # Efface le disque déplacé
    effaceDisque(disqueSup(coups[nbmax], der[0]), coups[nbmax], n)
    # reconfigurer le plateau pour annuler le dernier coup
    coups[nbmax][der[1]].append(coups[nbmax][der[0]].pop())
    # Redessiner le disque déplacé
    dessineDisque(disqueSup(coups[nbmax], der[1]), coups[nbmax], n)

    del coups[nbmax] # Supprimer l'état actuel du plateau du dictionnaire coups

#==== Partie E
# Fonction personnelle
def tri_par_selection(liste, index=None):
    """
    Tri une liste dans l'ordre croissant. L'argument index facultatif permet de
    trier selon index de chaque élément de la liste. La valeur par défaut de cet
    argument est Aucun, ce qui signifie qu'aucun index ne sera utilisé lors du
    tri.

    >>> a = [3, 1, 4, 1, 5, 9, 2]
    >>> b = [(3, 2), (1, 3), (2, 1)]
    >>> tri_par_selection(a)
    >>> tri_par_selection(b,1)
    >>> a
    [1, 1, 2, 3, 4, 5, 9]
    >>> b
    [(2, 1), (3, 2), (1, 3)]
    """
    n = len(liste)
    for i in range(n - 1): # Parcourir la liste
        min_index = i # Initialiser l'index du minimum pour cette itération
        for j in range(i + 1, n): # Chercher le plus petit élément dans le reste
            #de la liste
            
            # si pas d'indice n'est spécifié
            cdt1 = (index == None and liste[j] < liste[min_index])
            # si un indice est spécifié
            cdt2 = (index != None and liste[j][index] < liste[min_index][index])

            # Effectuer la permutation s'il y a une condition de vraie
            if cdt1 or cdt2 :
                min_index = j # Mettre à jour l'index du minimum
        # Permutation des éléments
        liste[i], liste[min_index] = liste[min_index], liste[i]

# Fonction demandée
def sauvScore(scores, nom_joueur, nb_disques, nb_coups, temps_jeu):
    """
    Enregistre le score du joueur (nom, nombre de disques, nombre de coups,
    durée de jeu) dans le dictionnaire des scores.
    """
    if nom_joueur not in scores:
        scores[nom_joueur] = [] # Initialise une liste vide pour le joueur

    infos_partie = {
        'nombre_de_disques': nb_disques,
        'nombre_de_coups': nb_coups,
        'temps_jeu': temps_jeu
    }
    scores[nom_joueur].append(infos_partie)

# Fonction demandée
def afficheScores(scores):
    """
    Affiche un tableau des meilleurs scores (plus petit nombre de coups) pour
    chaque nombre de disques.
    """
    scores_tries = {} # dictionnaire des scores triés par nombre de disques

    # scores par nombre de disques
    for nom_joueur in scores:
        # pour chaque joueur et chaque partie jouée par le joueur
        for partie in scores[nom_joueur]:
            nb_disques = partie['nombre_de_disques']
            nb_coups = partie['nombre_de_coups']
            # si le nombre de disques n'est pas encore dans le dictionnaire,
            # initialiser une liste vide pour ce nombre de disques
            if nb_disques not in scores_tries: scores_tries[nb_disques] = []
            scores_tries[nb_disques].append((nb_coups, nom_joueur))

    # meilleurs scores pour chaque nombre de disques
    for nb_disques in scores_tries:
        # pour chaque score regroupé par nombre de disques
        print("\nMeilleurs scores pour", nb_disques, "disques:")
        tri_par_selection(scores_tries[nb_disques])
        for score in scores_tries[nb_disques]: 
            # Parcourir les scores triés, afficher le nom du joueur et son score
            print(score[1] + " :", score[0], "coups")

# Fonction demandée
def afficheChronos(scores):
    """
    Affiche le classement en durée de jeu pour chaque joueur.
    """
    for nom_joueur in scores:
        # Parcourir chaque joueur dans le dictionnaire scores
        print("\nDurée de jeu pour " + nom_joueur + ":")
        # Parcourir chaque partie jouée par le joueur
        for partie in scores[nom_joueur]:
            # Afficher le temps de jeu et le nombre de disques pour
            # chaque partie
            print(str(partie['temps_jeu']) + " secondes pour " + str(partie['no\
mbre_de_disques']) + " disques.")

# Fonction demandée
def reflexionMoy(scores, nom_joueur):
    """
    Calcule le temps moyen de réflexion par coup pour un joueur donné.
    """
    total_temps = 0
    total_coups = 0

    if nom_joueur in scores: # vérifie si le joueur existe dans le dictionnaire
        for partie in scores[nom_joueur]:
            total_temps += partie['temps_jeu'] # cumuler le temps de jeu
            total_coups += partie['nombre_de_coups'] # cumuler le nb de coups

        # calcul du temps moyen par coup
        if total_coups > 0: # vérifier que le joueur a joué au moins un coup
            temps_moyen = total_temps / total_coups
            print(nom_joueur + " :", temps_moyen, "secondes par coup")
        else: # le joueur n'a joué aucun coup
            print("Pas de données de jeu pour", nom_joueur)
    else: # le joueur n'est pas trouvé dans le dictionnaire
        print("Joueur", nom_joueur, "introuvable")

# Fonction personnelle
def classementRapide(scores):
    """
    Affiche un classement des joueurs en fonction de leur temps moyen de
    réflexion par coup.
    """
    classement = [] # liste pour stocker le classement des joueurs
    for nom_joueur in scores: # pour chaque joueur dans le dictionnaire
        total_temps = 0
        total_coups = 0

        for partie in scores[nom_joueur]:
            # pour chaque partie jouée par le joueur
            total_temps += partie['temps_jeu'] # Cumuler le temps de jeu
            total_coups += partie['nombre_de_coups'] # Cumuler le nb de coups

        if total_coups > 0: # si le joueur a joué au moins un coup
            # Calculer le temps moyen par coup
            temps_moyen = total_temps / total_coups
            # Ajouter le joueur au classement
            classement.append((nom_joueur, temps_moyen))

    tri_par_selection(classement, 1)

    print("Classement des joueurs par temps moyen de réflexion par coup :")
    for nom_joueur, temps_moyen in classement:
        # Afficher le temps moyen de réflexion par coup pour chaque joueur
        reflexionMoy(scores, nom_joueur)

#==== Partie F

def resoudreHanoi(n, depart, arrivee, intermediaire, mouvements):
    """
    Résout de manière récursive le problème des Tours de Hanoï.
    Enregistre chaque mouvement dans la liste 'mouvements'.
    """
    if n > 0:
        # Déplacer n-1 disques vers l'intermédiaire
        resoudreHanoi(n-1, depart, intermediaire, arrivee, mouvements)
        # Déplacer le disque restant vers l'arrivée
        mouvements.append((depart, arrivee))
        # Déplacer les n-1 disques de l'intermédiaire vers l'arrivée
        resoudreHanoi(n-1, intermediaire, arrivee, depart, mouvements)

def animerMouvements(mouvements, plateau, n):
    """
    Anime une liste de mouvements dans l'interface graphique Turtle.
    """
    for depart, arrivee in mouvements: # pour chaque mouvement dans la liste
        # le disque supérieur sur la tour de départ
        disque = disqueSup(plateau, depart)
        # le disque de la tour de départ
        effaceDisque(disque, plateau, n)
        # déplacer le disque dans le plateau
        plateau[arrivee].append(plateau[depart].pop())
        # dessiner le disque sur la tour d'arrivée
        dessineDisque(disque, plateau, n)
        time.sleep(0.5)

def voirSolution(n,plateau):
    """
    Génère et affiche la solution pour n disques.
    """
    mouvements = []
    resoudreHanoi(n, 0, 2, 1, mouvements) # générer la solution
    print("Solution pour", n, "disques :")
    for m in mouvements: # Afficher chaque mouvement de la solution
        print("Déplacer le disque de la tour", m[0], "vers la tour", m[1])

    dessinePlateau(n)
    dessineConfig(plateau, n)
    animerMouvements(mouvements, plateau, n)

# doctest
if __name__ == "__main__":
    import doctest
    doctest.testmod()

# Programme principal
if __name__ == "__main__":
    scores = {
        'j1':
        [
            {
                'nombre_de_disques': 2,
                'nombre_de_coups': 3,
                "temps_jeu":10
            },
            {
                'nombre_de_disques': 3,
                'nombre_de_coups': 10,
                "temps_jeu":9
            },
            {
                'nombre_de_disques': 3,
                'nombre_de_coups': 7,
                "temps_jeu":8
            }
        ],
        'j2':
        [
            {
                'nombre_de_disques': 2,
                'nombre_de_coups': 4,
                "temps_jeu":7
            },
            {
                'nombre_de_disques': 3,
                'nombre_de_coups': 10,
                "temps_jeu":11
            },
            {
                'nombre_de_disques': 3,
                'nombre_de_coups': 9,
                "temps_jeu":12
            }
        ]
    }
    # exemple d'un dictionnaire scores préenregistré
    jeu = True
    while jeu: # Boucle du programme
        # Affichage menu
        print("\nMenu Principal")
        print("1. Jouer une partie")
        print("2. Afficher les scores")
        print("3. Afficher les chronos")
        print("4. Afficher le classement des joueurs les plus rapides")
        print("5. Voir la solution pour un nombre de disques donné")
        print("6. Quitter")
        choix = input("Entrez votre choix : ")
        if choix == "1": # Jouer une partie
            nb = int(input("Saisir le nombre de disques : "))
            plateau = init(nb)
            # le coup 0 est la configuration initial du plateau
            coups = {0: deepcopy(plateau)}
            curseur = init_turtle() # initialisation de turtle
            dessinePlateau(nb)
            dessineConfig(plateau, nb)

            debut = time.time() # Début du chronométrage
            nb_coup = boucleJeu(plateau, nb)
            fin = time.time() # Fin du chronométrage

            effaceTout(plateau,nb) # Quand le joueur a fini : effacer le plateau
            
            # Fermeture de la fenêtre :
            turtle.bye()
            turtle.Turtle._screen = None
            turtle.TurtleScreen._RUNNING = True
            
            temps_jeu = fin - debut
            print("Gagné en " + str(nb_coup) + " coups !\nNombre de coups minim\
um nécessaires pour finir :", 2**nb - 1)
            nom_joueur = input("Entrez votre nom : ")
            sauvScore(scores, nom_joueur, nb, nb_coup, temps_jeu)
            print("Score enregistré avec succès!")
        elif choix == "2": # Afficher les scores
            afficheScores(scores)
        elif choix == "3": # Afficher les chronos
            afficheChronos(scores)
        elif choix == "4": # Afficher le classement des joueurs les plus rapides
            classementRapide(scores)
        elif choix == "5": # Voir la solution pour un nombre de disques donné
            nb_disques = int(input("Entrez le nombre de disques pour la solutio\
n : ")) # nombre de disque
            plateau = init(nb_disques)
            curseur = init_turtle() # initialisation de turtle
            voirSolution(nb_disques,plateau)
            effaceTout(plateau,nb_disques) # Quand le jeu a fini : effacer le 
            # plateau
            # Fermeture de la fenêtre :
            turtle.bye()
            turtle.Turtle._screen = None
            turtle.TurtleScreen._RUNNING = True
        elif choix == "6": # Quitter
            jeu = False
        else:
            print("Choix invalide, veuillez réessayer.")