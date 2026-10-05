import { EmptyMessage } from "../shared";
import { Navbar } from "./Navbar";
import { Page } from "./Page";
import { PageHeader } from "./PageHeader";

export function NotFound() {
  return (
    <Page>
      <PageHeader title="Not found" />
      <EmptyMessage header="This page doesn't exist." message="It may have been deleted." />
      <Navbar backHref="/" />
    </Page>
  );
}
