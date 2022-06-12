import clientPromise from '../../../libs/mongodb';
import { NextApiRequest, NextApiResponse } from 'next';
import { IUser } from './types';

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  if (req.method === 'POST') {
    const { username, password } = req.body;
    const db = (await clientPromise).db();
    const usersWithSameInfos = (await db
      .collection('users')
      .find({
        username
      })
      .toArray()) as unknown as IUser[];
    console.log('username:', username)
      console.log('password:', password)
    console.log('arrayWithUsers: ', usersWithSameInfos)
    if (usersWithSameInfos.length > 0) {
      return res.status(401).json({ message: 'This user has already an owner' });
    }

    await db.collection('users').insertOne({
      username: username,
      password: password,
      watchedMovies: [],
      totalTimeWatched: 0
    });

    return res.status(201).json({ message: 'User created' });
  }
}
