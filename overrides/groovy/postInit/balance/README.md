# Balance

Place your mod based changes (buff/balance/recipe changes) on this directory.

## Examples

```groovy
// if you want to use gregtech's 'meta' you must import this
import static NomiUtil.meta
// Create a shapeless crafting using groovy
crafting.shapelessBuilder()
	.name("contenttweaker:infinity_plate")
	.output(item('moreplates:infinity_plate'))
	.input(meta('ingotInfinity'))
	.register()
```
