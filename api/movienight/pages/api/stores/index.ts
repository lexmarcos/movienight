import { IStoreItem, IStoreItemBody } from './types';
import clientPromise from '../../../libs/mongodb';
import { NextApiRequest, NextApiResponse } from 'next';
import { decodeJWT } from '../../../utils/verifyJWT';
import { IToken } from '../auth/types';
import { ObjectId } from 'mongodb';

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  if (req.method === 'POST') {
    const token = decodeJWT(req) as unknown as IToken;
    if (!token) {
      return res.status(401).json({ message: 'Unauthorized' });
    }
    const db = (await clientPromise).db();
    const { movieID, item } = req.body as IStoreItemBody;
    await db.collection('stores').updateOne(
    { movieID: movieID }, 
    { $push: { products: item } },
    { upsert: true }
    );

    return res.status(201).json({ message: 'Item added' });
  }
  else if(req.method === 'GET'){
    const token = decodeJWT(req) as unknown as IToken;
    if (!token) {
      return res.status(401).json({ message: 'Unauthorized' });
    }
    const db = (await clientPromise).db();
    const stores = await db.collection('stores').find().toArray() as unknown as IStoreItem[];
    return res.status(200).json({ stores });
  }
}
