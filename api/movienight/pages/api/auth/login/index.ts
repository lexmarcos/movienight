import jwt from 'jsonwebtoken';
import clientPromise from '../../../../libs/mongodb';
import { NextApiRequest, NextApiResponse } from 'next';
import { IUser } from './../types';


export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  const jwtKey = process.env.JWTKEY;
  if(req.method === 'POST'){
    const { username, password } = req.body;
    const db = (await clientPromise).db();
    const user = (await db
      .collection('users')
      .findOne({
        username,
      })) as unknown as IUser;
    const token = jwt.sign(user, jwtKey as string, {
      expiresIn: "7d" // expires in 7 days
    });
    return res.json({ auth: true, token: token, user });
  }
}