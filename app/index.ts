import { FastifyReply, FastifyRequest } from 'fastify';
import { server } from '../server';

// Define routes and plugins.
server.get('/ping', async (request: FastifyRequest, reply: FastifyReply) => {
  reply.send({message: 'Ok'});
});

// Start the server.
server.listen();