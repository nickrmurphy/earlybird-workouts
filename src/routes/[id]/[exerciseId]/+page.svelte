<script>
  import Heading from "../../../Heading.svelte";
  import { ArrowLeft } from "../../../icons";
  import Input from "../../../Input.svelte";
    let {data } = $props();
</script>

<nav>
    <a href={`/${data.workoutId}`}>
        <ArrowLeft />
        Back
    </a>
</nav>
<header>
    <Heading>Bench Press</Heading>
</header>
<main>
    <label>
        Weight
        <Input type="number" step={0.5} inputmode="decimal" />
    </label>
    <label>
        Sets
        <Input type="number" step={1} inputmode="numeric"  />
    </label>
    <label>
        Reps
        <Input  type="number" step={1} inputmode="numeric" />
    </label>
</main>

<style>
     nav {
        padding: var(--size-3) var(--size-2);
        a {
            display: flex;
            align-items: center;
            gap: var(--size-2);
            :global(svg) {
                height: var(--size-4);
                width: var(--size-4);
            }
        }
    }

    header, main {
        padding: var(--size-1) var(--size-2);
    }

    main {
        display: flex;
        flex-direction: column;
        gap: var(--size-4);
    }

    label {
        display: flex;
        flex-direction: column;
        gap: var(--size-2);
        font-weight: var(--font-weight-6);
    }

</style>