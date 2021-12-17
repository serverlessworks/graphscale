
import { ApolloServer } from "apollo-server-lambda";
import { typeDefs } from "src/schemas/typeDefs";
import { resolvers} from "src/resolvers";

const server = new ApolloServer({
  typeDefs,
  resolvers,
  context: ({ event, context, express }) => ({
    headers: event.headers,
    functionName: context.functionName,
    event,
    context,
    expressRequest: express.req,
  }),
});

exports.handler = server.createHandler();
