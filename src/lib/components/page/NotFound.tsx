import { EmptyMessage } from "../shared";
import { Page } from "./Page";
import { PageHeader } from "./PageHeader";

export function NotFound() {
  return (
    <Page>
      <PageHeader title="Not found" backHref="/" />
      <EmptyMessage header="This page doesn't exist." message="It may have been deleted." />
    </Page>
  );
}
