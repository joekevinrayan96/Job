package Test;


public class TestRun {
	public static IShape GetShapeWithLargestArea(IShape[] shapes) {

		float largestArea = 0;
		
		IShape largestAreaShape = null;

		for (int i = 0; i < shapes.length; i++) {

			if (shapes[i].CalculateArea() > largestArea) {

				largestArea = shapes[i].CalculateArea();
				largestAreaShape = shapes[i];
			}

		}
		return largestAreaShape;
	}
	
public static void testGetShapeWithLargestArea() {
		
		IShape[] Shapelist = new IShape[2];

		Shapelist[0] = new Square("Square", 40);
		Shapelist[1] = new Circle("Circle", 50);

		IShape largestShape = GetShapeWithLargestArea(Shapelist);

		System.out.println(largestShape.showName());
	}

public static void main(String[] args) {
	testGetShapeWithLargestArea();
}

}
