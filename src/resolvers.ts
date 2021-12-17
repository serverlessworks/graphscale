import { HelloQueryInput, HelloMutationInput, Message } from "src/types";

const queries = {
  hello(
    _root: unknown,
    { input }: { input: HelloQueryInput }
  ): Promise<Message> {
    return new Promise<Message>((resolve, reject) => {
      resolve({
        msg: `Hello ${input.firstName} ${input.lastName}`,
      });
      reject(console.log("promise rejected"));
    });
  },
};

const mutations = {
  hello(
    _root: unknown,
    { input }: { input: HelloMutationInput }
  ): Promise<Message> {
    return new Promise<Message>((resolve, reject) => {
      resolve({
        msg: `Hello ${input.firstName} ${input.lastName}`,
      });
      reject(console.log("promise rejected"));
    });
  },
};

export const resolvers = {
  Query: {
    ...queries,
  },
  Mutation: {
    ...mutations,
  },
};
