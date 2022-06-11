import { NextApiRequest, NextApiResponse } from 'next';
import { IToken } from './../types';
import { decodeJWT } from '../../../../utils/verifyJWT';

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const token = decodeJWT(req) as unknown as IToken;
  if (!token) {
    return res.status(401).json({ message: 'Unauthorized' });
  }
  res.status(200).json({ auth: false, token: null, user: null });
}
