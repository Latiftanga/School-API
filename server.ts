import fastify, { FastifyInstance } from 'fastify';

export const server: FastifyInstance = fastify();

// Start the server.
server.listen({ port: 3000 }, (err, address) => {
  if (err) {
    console.error(err);
    process.exit(1);
  }

  console.log(`Server ready at ${address}`);
});