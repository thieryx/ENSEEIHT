public class ExempleSchema1 {
  public static void main(String[] args) {
    Point p1 = new Point(3, 2);
    Point p2 = new Point(11,4);
    Point p3 = new Point(6,9);
    Segment s12 = new Segment(p1,p2);
    Segment s23 = new Segment(p2,p3);
    Segment s13 = new Segment(p1,p3);
    Point barycentre = new Point((p1.getX()+p2.getX()+p3.getX())/3, (p1.getY()+p2.getY()+p3.getY())/3);
    System.out.print("Segment s12 : ");
    s12.afficher();
    System.out.println();
    System.out.print("Segment s23 : ");
    s23.afficher();
    System.out.println();
    System.out.print("Segment s13 : ");
    s13.afficher();
    System.out.println();
    System.out.print("Barycentre : ");
    barycentre.afficher();
    System.out.println();
  }
}
