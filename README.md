# Dart OOP Assignment: Kigali Bus Card

**Name:** Engonga Ebang Achille Beranger
**Student ID:** 16451/2020

## My numbers
- D = 51
- L = 1
- Starting balance = 1510 RWF
- Bus fare = 251 RWF
- Student discount = 11%

## Output of main.dart
```
Error: name too short
Owner: Ama | Balance: 1510 RWF
Owner: Engonga Ebang Achille Beranger | Balance: 1510 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 251 RWF
Paid 251 RWF
Owner: Engonga Ebang Achille Beranger | Balance: 3008 RWF
Student discount: 27 RWF
Paid 224 RWF
Owner: Engonga Ebang Achille Beranger | Balance: 1286 RWF
Student card: 11% off
```

## Part 1: Why no setter for balance?

There is no setter for balance because the balance on a bus card should only be modified through controlled operations like top-up (which validates the amount) and payment (which checks if there are sufficient funds). If we allowed direct assignment to balance, someone could arbitrarily increase or decrease the balance without going through these validation rules, which would break the integrity of the bus card system. Keeping balance private and only exposing it through a getter ensures that all changes happen through validated methods.

## Part 2: What does ~/ do?

The `~/` operator performs integer division in Dart. It divides two numbers and returns the result as an integer, truncating any decimal part.

For example:
- `print(237 * 17 / 100);` outputs `40.29` (floating-point division)
- `print(237 * 17 ~/ 100);` outputs `40` (integer division, truncates the decimal)

In the context of the StudentCard, we use `~/` because the discount amount should be a whole number of RWF, not a decimal amount.

## Part 4: Bug table

| Bug | The line | Why it is wrong (your words) | Your fix |
|-----|----------|------------------------------|----------|
| 1 | `String _brand;` and `int _battery;` | Fields are not initialized, but Dart requires non-nullable fields to be initialized before use. | Add default values: `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The constructor does not call `super(brand, battery)` to initialize the parent class fields. | Add `: super(brand, battery)` before the constructor body. |
| 3 | `@override` on `restart()` | The parent class `Phone` does not have a `restart()` method, so `@override` is invalid. | Remove `@override` or add a `restart()` method to `Phone`. |
| 4 | `print(p.battery());` | `battery` is a getter, not a method. You cannot call it with parentheses. | Change to `print(p.battery);` |
| 5 | Missing setter for battery | The line `p.battery = 100;` requires a setter, but none exists. | Add a setter that accepts only 0 to 100. |

**Not a bug:** `p.battery = 100;` - This line is fine because after adding the setter, it will correctly set the battery level to 100.

## Part 5

**My prediction:**
```
1
3
```
Explanation:
- `Bag a = Bag();` - creates a Bag with 0 items
- `a.add();` - increments to 1
- `a.items = -5;` - setter ignores negative values, stays at 1
- `print(a.items);` - prints 1

- `BigBag b = BigBag();` - creates a BigBag with 0 items
- `b.add();` - BigBag's add calls super.add() twice, so increments by 2
- `b.add();` - again increments by 2, total = 4
- `b.items = b.items + 1;` - sets items to 5
- `print(b.items);` - prints 5

**Real output:**
```
1
5
```

**Was I right?** 
No, I was wrong about the BigBag output. I predicted 3 but got 5. I forgot that BigBag's `add()` method calls `super.add()` twice, so each call to `b.add()` adds 2 items. After two calls, we have 4 items, and then `b.items = b.items + 1;` sets it to 5.