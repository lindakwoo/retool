export default async function (_req: { params: Record<string, never>; user: User }) {
  return { message: "hello from the backend!!" }
}
