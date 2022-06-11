import { IUser } from './../auth/types';
import clientPromise from '../../../libs/mongodb';
import { NextApiRequest, NextApiResponse } from 'next';
import { IMovie } from './types';
import { decodeJWT } from '../../../utils/verifyJWT';
import { IToken } from '../auth/types';
import { ObjectId } from 'mongodb';

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  if (req.method === 'POST') {
    const token = decodeJWT(req) as unknown as IToken;
    if (!token) {
      return res.status(401).json({ message: 'Unauthorized' });
    }
    const data = req.body as IMovie;
    const db = (await clientPromise).db();
    const {password, ...user} = await db.collection('users').findOne({ _id: new ObjectId(token._id) }) as unknown as IUser;

    if(!user){
      return res.status(403).json({ message: 'User not found' });
    }

    user.watchedMovies.push(data);
    user.totalTimeWatched += data.runtime;

    await db.collection('users').updateOne({ _id: new ObjectId(token._id) }, { $set: { watchedMovies: user.watchedMovies, totalTimeWatched: user.totalTimeWatched } });

    return res.status(201).json({ message: 'Movie added', user });
  }
}
