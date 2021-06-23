package Test;

public class Circle implements IShape{

	private float radius;
	private String name;
	
	public Circle(String name, float radius) {
		this.name=name;
		this.radius=radius;
	}

	@Override
	public float CalculateArea() {
		return (22/7)*radius*radius;
	}

	@Override
	public float CalculatePerimeterLength() {
		return 2*(22/7)*radius;
	}

	@Override
	public String showName() {
		return this.name;
	}

}
