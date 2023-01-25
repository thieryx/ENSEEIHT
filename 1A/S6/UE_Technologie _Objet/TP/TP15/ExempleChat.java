
public class ExempleChat {
    
    public static void main(String[] args) throws InterruptedException {
        if (args.length ==0) {
            args = new String[] { "Moi", "Toi", "Lui"};
        }

        Chat c = new Chat();

        int x= 10;
        int y =10;
        for(String nom: args) {
            new ChatSwing(c, nom);
        }
    }
}
