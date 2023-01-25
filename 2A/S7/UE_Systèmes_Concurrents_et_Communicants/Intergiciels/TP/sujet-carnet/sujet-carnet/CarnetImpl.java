import java.rmi.*;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.*;
import java.util.*;

public class CarnetImpl extends UnicastRemoteObject implements Carnet {

  HashMap<String, RFiche> carnet = new HashMap<>();

  public CarnetImpl() throws RemoteException {
    super();
    System.out.println("Serveur crée");
  }
  @Override
	public void Ajouter(SFiche sf) throws RemoteException {
    carnet.put(sf.getNom(), new RFicheImpl (sf.getNom(), sf.getEmail()));
  }

  @Override
	public RFiche Consulter(String n, boolean forward) throws RemoteException {
    if (forward) {
      return carnet.get(n);
    } else {
      return null;
    }
  }
    public static void main (String[] args) {
      try {
        LocateRegistry.createRegistry(1234);
        CarnetImpl carnet = new CarnetImpl();
        Naming.bind("//localhost:1234/carnet", carnet);
      } catch (Exception e) {
        e.printStackTrace();
      }
    
  }

}
