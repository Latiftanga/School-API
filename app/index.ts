import { FastifyReply, FastifyRequest } from 'fastify';
import { server } from '../server';
import { userRoutes } from './modules/users/users.routes';
import { userSchemas } from './modules/users/users.schema';
import { fastifyJwt } from '@fastify/jwt';

// Define routes and plugins.
server.register(fastifyJwt, {secret: 'diew0qiwieonsiradnaririeqirnqirir'});
server.decorate('auth',async (request:FastifyRequest, reply:FastifyReply) => {
  try {
    await request.jwtVerify()
  } catch (e) {
    return reply.send(e)
  }
})
server.get('/ping', async (request: FastifyRequest, reply: FastifyReply) => {
  reply.send({message: 'Ok'});
});

for(const schema of userSchemas){
  server.addSchema(schema)
}
server.register(userRoutes, {prefix: '/api/users'})
// Start the server.
server.listen();