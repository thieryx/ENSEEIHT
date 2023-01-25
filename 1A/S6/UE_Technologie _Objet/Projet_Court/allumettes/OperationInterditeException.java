package allumettes;

/**
 * Exception qui indique que l'opération est interdite.
 */

public class OperationInterditeException extends RuntimeException {
    /**
     * Initaliser une ConfigurationException avec le message précisé.
     *
     * @param message le message explicatif
     */
    public OperationInterditeException(String message) {
        super(message);
    }
}
