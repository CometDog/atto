import "package:test/test.dart";
import "package:atto/main.dart";

void main()
{
	test("LandingPage.generateNewRandomString() generates an appropriate random string", ()
	{
		LandingPage landingPage = new LandingPage();
		expect(Login.randomString, "mejdownsatto");

		landingPage.generateNewRandomString();
		String firstString = Login.randomString;
		expect(firstString, startsWith("mejdownsatto"));

		landingPage.generateNewRandomString();
		String secondString = Login.randomString;
		expect(secondString, startsWith("mejdownsatto"));

		assert(firstString != secondString);
	});
}