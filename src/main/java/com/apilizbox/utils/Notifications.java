package com.apilizbox.utils;

/**
 * Created by laurent on 17/03/2014.
 * Liste des notifications identifié par leur type, et contenant le titre de la notification ainsi qu'un message (ce dernier étant
 * éventuellement personnalisable via un stringformat)
 */
public class Notifications {

    /**
     * Message de bienvenue
     */
    public class NotificationWelcome implements NotificationGabarit{
        public static final String message = "Bienvenue sur Lizbox ! " +
                "Vous disposez maintenant de votre " +
                "propre interface Lizbox sur laquelle vous pourrez enregistrer, retrouver, partager " +
                "l'ensemble de vos documents !";
        public static final String type = "welcome";
        public static final String title = "Bienvenue";
    }

    /**
     * Message de partage d'un document au recepteur
     */
    public class NotificationShare implements NotificationGabarit{
        public static final String message = "Le document %s vous a été partagé.";
        public static final String type = "partage";
        public static final String title = "%s a partagé un document avec vous";
    }

    /**
     * Suppression d'un partage
     */
    public class NotificationRemoveShare implements NotificationGabarit{
        public static final String message = "Le partage du document %s a été supprimé.";

        public static final String type = "supprimePartage";
        public static final String title = "%s a supprimé un partage avec vous";
    }

    /**
     * Suppression d'un document (partagé)
     */
    public class NotificationRemoveFileShared implements NotificationGabarit{
        public static final String message = "Le document %s a été supprimé.";

        public static final String type = "supprimeDocument";
        public static final String title = "%s a supprimé un document partagé";
    }

    public interface NotificationGabarit{
        public static final String message = "";
        public static final String type = "";
        public static final String title = "";
    }
}


