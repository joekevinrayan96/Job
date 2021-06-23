package Test;

public class Square implements IShape{
	
	private float length;
	private String name;

	public Square(String name, float length) {
		this.name=name;
		this.length=length;
		
	}

	@Override
	public float CalculateArea() {
		return length*length;
	}

	@Override
	public float CalculatePerimeterLength() {
		return 4*length;
	}

	@Override
	public String showName() {
		return this.name;
	}

}
