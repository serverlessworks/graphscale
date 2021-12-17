import { ApolloServer } from "apollo-server";
import { ApolloServerPluginLandingPageGraphQLPlayground } from "apollo-server-core";
import { typeDefs } from "src/schemas/typeDefs";
import { resolvers} from "src/resolvers";

const server = new ApolloServer({
  typeDefs,
  resolvers,
  introspection: true,
  plugins: [ApolloServerPluginLandingPageGraphQLPlayground()]
});

server.listen().then(({ url }) => {
  console.log(`🚀 Server is ready`, { url: url });
});
