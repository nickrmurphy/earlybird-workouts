<script module>
  import { defineMeta } from "@storybook/addon-svelte-csf";
  import { Button } from "$lib/components";
  import { fn } from "@storybook/test";

  // More on how to set up stories at: https://storybook.js.org/docs/writing-stories
  const { Story } = defineMeta({
    title: "Example/Button",
    component: Button,
    tags: ["autodocs"],
    argTypes: {
      size: {
        control: { type: "select" },
        options: ["small", "medium", "large"],
      },
    },
    args: {
      onclick: fn(),
    },
  });
</script>

{#snippet content()}
  Hello, button
{/snippet}

<!-- More on writing stories with args: https://storybook.js.org/docs/writing-stories/args -->
<Story name="Primary" args={{ children: content }} />
