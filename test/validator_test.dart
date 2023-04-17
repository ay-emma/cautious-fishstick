// simple ui
// collects input with this validators.
// react to user input
// add a button
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_test/validators.dart';

void main() {
  final Validator validator = Validator();
  group("Validator Test-", (() {
    group("ValidateZipCode - ", () {
      test("when a valide zip code is entered", () {
        const test1 = "901101";
        const test2 = "901101.0";
        const test3 = "0xff89a";

        expect(validator.validateZipCode(test1), true);
        expect(validator.validateZipCode(test2), false);
        expect(validator.validateZipCode(test3), false);
      });
    });

    group("Validate password - ", () {
      test("Check password strenght ", () {
        //not only numbers
        const test1 = "909089898";
        //not only Uppercase
        const test2 = "ABCED";
        //not only specail characters
        const test3 = "*)))((()))";
        //not only lower
        const test4 = "abcdegghe";
        //lenght 8 or more
        const test5 = "Pas@12";
        //shoulbe be valid
        const test6 = "Password0@";

        const errorString = "Please fill in the right characters";

        expect(validator.validatePassword(test1), errorString);
        expect(validator.validatePassword(test2), errorString);
        expect(validator.validatePassword(test3), errorString);
        expect(validator.validatePassword(test4), errorString);
        expect(validator.validatePassword(test5), errorString);
        expect(validator.validatePassword(test6), null);
      });
    });

    group("Validate email - ", () {
      test("Check if email is valide", () {
        expect(validator.validateEmail("emmanuel@gmail.com"), null);
        expect(validator.validateEmail("emmmanuel.ayo.yinka@mail.com"), null);

        //? why is this not working.
        // expect(validateEmail("emmmanuel+ayo@gmail.com"), true, skip: true);
        String expectedString = "Invalide email address";
        expect(validator.validateEmail("ayo@dreamlabsengr.mail.com"), null);
        expect(validator.validateEmail("ayo@.com"), expectedString);
        expect(validator.validateEmail("sample@com."), expectedString);
        expect(validator.validateEmail("@sampleayo.com"), expectedString);

        const no = 087;
        expect(no, isA<int>()); // 🫣
      });
    });

    group("Validate IP Address -", () {
      //? ipv4
      // Arrange

      // Act

      // Assert
      group("Validate IPV4 Address - ", () {
        test("Ip Address is empty", () {
          expect(validator.validateIpv4Address(''), isFalse);
        });
        test("invalid ip Address", () {
          expect(validator.validateIpv4Address('256.256.256.256'), isFalse);
        });
        test("Ip address with more than 4 dots", () {
          expect(validator.validateIpv4Address('192..168.0.1'), isFalse);
          expect(validator.validateIpv4Address('192.16.8.0.1'), isFalse);
        });
        test("Ip address with alphabets", () {
          expect(validator.validateIpv4Address('192.168.0.IP'), isFalse);
        });
        test("Ip address with special characters", () {
          expect(validator.validateIpv4Address('192.168.@.1'), isFalse);
        });
      });

      //? ipv6
      group("Validate IPV6 Address - ", () {
        test('valid IPv6 address', () {
          expect(
              validator.validateIpv6Address(
                  '2001:0db8:85a3:0000:0000:8a2e:0370:7334'),
              isTrue);
        });

        test('empty IPv6 address', () {
          expect(validator.validateIpv6Address(''), isFalse);
        });

        test('IPv6 address with extra colons', () {
          expect(
              validator.validateIpv6Address('2001:0db8:85a3:::8a2e:0370:7334'),
              isFalse);
        });

        test('IPv6 address with letters outside hex format', () {
          expect(
              validator.validateIpv6Address(
                  '2001:0db8:85a3:0000:0000:8a2e:0370:cdpk'),
              isFalse);
        });

        test('IPv6 address with special characters', () {
          expect(
              validator
                  .validateIpv6Address('2001:0db8:85a3:0000:0000:8a2e:0370:@'),
              isFalse);
        });
      });

      group("Algorithms - ", () {
        test("Longest prifix String", () {
          expect(validator.longestCommonPrefix(["flower", "flow", "flight"]),
              'fl');
          expect(validator.longestCommonPrefix(["dog", "racecar", "car"]), '');
        });
      });
    });

    // group end
  }));

  // end
}
