export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
};

export type HelloMutationInput = {
  firstName: Scalars['String'];
  lastName: Scalars['String'];
};

export type HelloQueryInput = {
  firstName: Scalars['String'];
  lastName: Scalars['String'];
};

export type Message = {
  __typename?: 'Message';
  msg: Scalars['String'];
};

export type Mutation = {
  __typename?: 'Mutation';
  hello: Message;
};


export type MutationhelloArgs = {
  input?: InputMaybe<HelloMutationInput>;
};

export type Query = {
  __typename?: 'Query';
  hello: Message;
};


export type QueryhelloArgs = {
  input?: InputMaybe<HelloQueryInput>;
};
